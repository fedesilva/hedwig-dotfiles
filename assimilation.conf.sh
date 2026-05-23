#!/usr/bin/env bash

SDKMAN_JAVA_VERSION="21.0.2-graalce"
SDKMAN_CANDIDATES=(
  scala
  sbt
)

COURSIER_BIN_DIR="$HOME/bin"
COURSIER_BIN_NAME="cs"

BREW_FORMULAE=(
  bash
  fzf
  gh
  git-town
  go
  hyperfine
  lazygit
  lld
  make
  neovim
  node
  rust
  rustup
  tmux
  tree
  tree-sitter-cli
  util-linux
  watch
  zoxide
  zsh-completions
)

BREW_CASKS=(
  alfred
  claude
  claude-code
  codex
  codex-app
  docker-desktop
  dropbox
  font-monaspace
  font-monaspace-frozen
  font-monaspace-nf
  font-monaspace-var
  font-monaspice-nerd-font
  ghostty
  sizeup
  vimr
)
