#!/usr/bin/env bash
set -euo pipefail

echo "Resistance is futile, you will be assimilated"

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_ROOT="${HOME}/.dotfiles-backups/$(date +%Y%m%d-%H%M%S)"
BOOTSTRAP_TOOLS=0

# shellcheck disable=SC1091
source "${DOTFILES_DIR}/assimilation.conf.sh"

for arg in "$@"; do
  case "$arg" in
    --bootstrap)
      BOOTSTRAP_TOOLS=1
      ;;
    -h|--help)
      cat <<EOF
Usage: $0 [--bootstrap]

Options:
  --bootstrap  Install Homebrew on macOS, SDKMAN on macOS/Linux, and dev tools.
EOF
      exit 0
      ;;
    *)
      echo "Unknown option: $arg" >&2
      exit 1
      ;;
  esac
done

is_macos() {
  [[ "$(uname -s)" == "Darwin" ]]
}

is_linux() {
  [[ "$(uname -s)" == "Linux" ]]
}

backup_target() {
  local target="$1"

  if [[ ! -e "$target" && ! -L "$target" ]]; then
    return 0
  fi

  mkdir -p "$BACKUP_ROOT"
  local backup_path="${BACKUP_ROOT}/${target#"$HOME"/}"
  mkdir -p "$(dirname "$backup_path")"
  mv "$target" "$backup_path"
  echo "Backed up $target -> $backup_path"
}

ensure_file() {
  local target="$1"

  if [[ -e "$target" || -L "$target" ]]; then
    echo "Exists $target"
    return 0
  fi

  mkdir -p "$(dirname "$target")"
  touch "$target"
  echo "Created $target"
}

link_file() {
  local source="$1"
  local target="$2"

  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    echo "Already linked $target -> $source"
    return 0
  fi

  backup_target "$target"
  mkdir -p "$(dirname "$target")"
  ln -s "$source" "$target"
  echo "Linked $target -> $source"
}

install_powerlevel10k() {
  local zsh_custom="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}"
  local theme_dir="${zsh_custom}/themes/powerlevel10k"

  if [[ -d "$theme_dir/.git" ]]; then
    echo "Powerlevel10k already installed at $theme_dir"
    return 0
  fi

  if ! command -v git >/dev/null 2>&1; then
    echo "git is not available; skipping Powerlevel10k install" >&2
    return 0
  fi

  mkdir -p "$(dirname "$theme_dir")"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$theme_dir"
  echo "Installed Powerlevel10k at $theme_dir"
}

install_homebrew() {
  if ! is_macos; then
    return 0
  fi

  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed"
    return 0
  fi

  if ! command -v curl >/dev/null 2>&1; then
    echo "curl is not available; cannot install Homebrew" >&2
    exit 1
  fi

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

install_sdkman() {
  if ! is_macos && ! is_linux; then
    echo "Skipping SDKMAN install on unsupported OS: $(uname -s)"
    return 0
  fi

  if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
    echo "SDKMAN already installed"
    return 0
  fi

  if ! command -v curl >/dev/null 2>&1; then
    echo "curl is not available; cannot install SDKMAN" >&2
    exit 1
  fi

  curl -s "https://get.sdkman.io" | bash
}

source_sdkman() {
  if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
    # shellcheck disable=SC1091
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    return 0
  fi

  echo "SDKMAN init script not found" >&2
  exit 1
}

sdk_install_if_missing() {
  local candidate="$1"
  local version="$2"

  if sdk current "$candidate" 2>/dev/null | grep -q "$version"; then
    echo "SDKMAN $candidate $version already current"
    return 0
  fi

  sdk install "$candidate" "$version"
  sdk default "$candidate" "$version"
}

brew_install_tools() {
  if ! is_macos; then
    return 0
  fi

  if ! command -v brew >/dev/null 2>&1; then
    echo "brew is not available after install" >&2
    exit 1
  fi

  brew update
  brew install "${BREW_FORMULAE[@]}"
  brew install --cask "${BREW_CASKS[@]}"
}

bootstrap_tools() {
  install_homebrew
  install_sdkman
  source_sdkman

  sdk_install_if_missing java "$SDKMAN_JAVA_VERSION"
  sdk default java "$SDKMAN_JAVA_VERSION"

  for candidate in "${SDKMAN_CANDIDATES[@]}"; do
    sdk install "$candidate"
  done

  brew_install_tools
}

link_file "${DOTFILES_DIR}/zsh/zshrc" "${HOME}/.zshrc"
link_file "${DOTFILES_DIR}" "${HOME}/.dotfiles"
ensure_file "${HOME}/.config/keys"
ensure_file "${HOME}/.config/aliases"
ensure_file "${HOME}/.config/source.list"

install_powerlevel10k

link_file "${DOTFILES_DIR}/nvim" "${HOME}/.config/nvim"

link_file "${DOTFILES_DIR}/git/gitconfig" "${HOME}/.gitconfig"
link_file "${DOTFILES_DIR}/git/gitignore" "${HOME}/.gitignore"
link_file "${DOTFILES_DIR}/ctags" "${HOME}/.ctags"

link_file "${DOTFILES_DIR}/tmux/tmux.conf" "${HOME}/.tmux.conf"

if [[ -f "${DOTFILES_DIR}/wezterm.lua" ]]; then
  link_file "${DOTFILES_DIR}/wezterm.lua" "${HOME}/.wezterm.lua"
fi

if [[ "$BOOTSTRAP_TOOLS" == "1" ]]; then
  bootstrap_tools
fi

echo "Assimilation complete"
