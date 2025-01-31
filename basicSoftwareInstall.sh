#!/bin/zsh

# Function to check if a package is installed
check_and_install() {
  local package=$1

  if brew list --versions "$package" &>/dev/null; then
    echo "$package is already installed. Version: $(brew list --versions "$package")"
  else
    echo "Installing $package..."
    brew install "$package"
  fi
}

# List of packages to check and install if necessary
packages=("git-gui" "giflib" "jadx" "scrcpy" "sqlite" "warp" "ghostscript" "imagemagick" "openjdk" "sqlite")

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Installing now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed. Version: $(brew --version | head -n 1)"
fi

# Iterate over the package list
for pkg in "${packages[@]}"; do
  check_and_install "$pkg"
done

echo "All packages checked."
