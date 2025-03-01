echo '#!/bin/bash' > reinstall-brew.sh
echo 'set -e' >> reinstall-brew.sh
echo 'echo "Installing Homebrew..."' >> reinstall-brew.sh
echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' >> reinstall-brew.sh
echo 'echo "Restoring packages..."' >> reinstall-brew.sh
awk '{print "brew install " $0}' brew-formulae.txt >> reinstall-brew.sh
awk '{print "brew install --cask " $0}' brew-casks.txt >> reinstall-brew.sh
chmod +x reinstall-brew.sh

