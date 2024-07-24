#!/bin/sh

# Files in ~
ln -nsf ~/dotfiles/xinitrc		~/.xinitrc
ln -nsf ~/dotfiles/Xresources	~/.Xresources
ln -nsf ~/dotfiles/zprofile		~/.zprofile
ln -nsf ~/dotfiles/zshrc		~/.zshrc

# Files in ~/.config
ln -nsf ~/dotfiles/picom		~/.config/picom.conf
ln -nsf ~/dotfiles/nvim			~/.config/nvim

# Files in ~/.config/*
ln -nsf ~/dotfiles/i3			~/.config/i3/config
ln -nsf ~/dotfiles/kitty		~/.config/kitty/kitty.conf
ln -nsf ~/dotfiles/mpv			~/.config/mpv/mpv.conf
ln -nsf ~/dotfiles/mpv-input	~/.config/mpv/input.conf
ln -nsf ~/dotfiles/ohmyposh		~/.config/oh-my-posh/prompt.toml
ln -nsf ~/dotfiles/ohmyposh-tty	~/.config/oh-my-posh/prompt-tty.toml
ln -nsf ~/dotfiles/polybar		~/.config/polybar/config.ini
ln -nsf ~/dotfiles/ranger		~/.config/ranger/rc.conf
