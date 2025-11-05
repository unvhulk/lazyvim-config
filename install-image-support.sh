#!/bin/bash
# Install dependencies for image rendering in Neovim

echo "Installing X11 dependencies for ueberzug..."
sudo apt-get update
sudo apt-get install -y libxres-dev libx11-dev libxext-dev

echo "Installing ueberzug via pip..."
pip3 install ueberzug

echo "Installation complete!"
echo "Now uncomment the image.nvim block in ~/.config/nvim/lua/plugins/image.lua"
echo "Lines 54-88, then restart Neovim"
