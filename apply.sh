#!/bin/sh

# Files in ~
ln -nsf ~/dotfiles/xinitrc		~/.xinitrc
ln -nsf ~/dotfiles/Xresources	~/.Xresources
ln -nsf ~/dotfiles/zprofile		~/.zprofile
ln -nsf ~/dotfiles/zshrc		~/.zshrc

# Files in ~/.config
mkdir ~/.config
ln -nsf ~/dotfiles/picom		~/.config/picom.conf
ln -nsf ~/dotfiles/nvim			~/.config/nvim

# Files in ~/.config/*
mkdir ~/.config/i3
ln -nsf ~/dotfiles/i3			~/.config/i3/config
mkdir ~/.config/kitty
ln -nsf ~/dotfiles/kitty		~/.config/kitty/kitty.conf
mkdir ~/.config/mpv
ln -nsf ~/dotfiles/mpv			~/.config/mpv/mpv.conf
ln -nsf ~/dotfiles/mpv-input	~/.config/mpv/input.conf
mkdir ~/.config/oh-my-posh
ln -nsf ~/dotfiles/ohmyposh		~/.config/oh-my-posh/prompt.toml
ln -nsf ~/dotfiles/ohmyposh-tty	~/.config/oh-my-posh/prompt-tty.toml
mkdir ~/.config/polybar
ln -nsf ~/dotfiles/polybar		~/.config/polybar/config.ini
mkdir ~/.config/ranger
ln -nsf ~/dotfiles/ranger		~/.config/ranger/rc.conf
