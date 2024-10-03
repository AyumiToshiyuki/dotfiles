#!/bin/sh

# Files in ~
ln -nsf ~/Dotfiles/xinitrc		~/.xinitrc
ln -nsf ~/Dotfiles/Xresources	~/.Xresources
ln -nsf ~/Dotfiles/zprofile		~/.zprofile
ln -nsf ~/Dotfiles/zshrc		~/.zshrc

# Files in ~/.config
ln -nsf ~/Dotfiles/picom		~/.config/picom.conf
ln -nsf ~/Dotfiles/nvim			~/.config/nvim

# Files in ~/.config/*
ln -nsf ~/Dotfiles/i3			~/.config/i3/config
ln -nsf ~/Dotfiles/kitty		~/.config/kitty/kitty.conf
ln -nsf ~/Dotfiles/mpv			~/.config/mpv/mpv.conf
ln -nsf ~/Dotfiles/mpv-input	~/.config/mpv/input.conf
ln -nsf ~/Dotfiles/ohmyposh		~/.config/oh-my-posh/prompt.toml
ln -nsf ~/Dotfiles/ohmyposh-tty	~/.config/oh-my-posh/prompt-tty.toml
ln -nsf ~/Dotfiles/polybar		~/.config/polybar/config.ini
ln -nsf ~/Dotfiles/ranger		~/.config/ranger/rc.conf
