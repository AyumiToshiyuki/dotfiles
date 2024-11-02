# Dotfiles

Those are my... well, dotfiles.

## Usage

```bash
git clone https://github.com/AyumiToshiyuki/dotfiles ~/
~/dotfiles/apply.sh
```

The `dotfiles` directory **HAS** to be in `~`, or else the `apply.sh` script won't work!

## Contains dotfiles for

- Xorg (Display Server)
- i3wm (Window Manager)
- Picom (Compositor)
- Polybar (Status Bar)
- Kitty (Terminal Emulator)
- Zsh (Shell)
- Oh-My-Posh (Shell Prompt)
- NeoVim (Text Editor)
- mpv (Media Player)
- Ranger (File Manager)

Also contains a `postinstall.sh` script to download minimal Apps, Dependencies and Fonts used on my system.
It only works on Arch Linux using the `yay` AUR helper.
