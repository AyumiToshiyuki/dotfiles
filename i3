
#		██╗██████╗ ██╗    ██╗███╗   ███╗
#		██║╚════██╗██║    ██║████╗ ████║
#		██║ █████╔╝██║ █╗ ██║██╔████╔██║
#		██║ ╚═══██╗██║███╗██║██║╚██╔╝██║
#		██║██████╔╝╚███╔███╔╝██║ ╚═╝ ██║
#		╚═╝╚═════╝  ╚══╝╚══╝ ╚═╝     ╚═╝

######################################################################## GENERAL

set $mod Mod4
floating_modifier $mod
bindsym $mod+Shift+R restart, reload
default_border pixel 3
default_floating_border pixel 3
focus_follows_mouse no
mouse_warping none

gaps inner 16
gaps outer 16
smart_gaps on
smart_borders on

######################################################################## WORKSPACES

bindsym $mod+mod2+KP_0 	workspace >
bindsym $mod+mod2+KP_1 	workspace 1
bindsym $mod+mod2+KP_2 	workspace 2
bindsym $mod+mod2+KP_3 	workspace 3
bindsym $mod+mod2+KP_4 	workspace 4
bindsym $mod+mod2+KP_5 	workspace 5
bindsym $mod+mod2+KP_6 	workspace 6
bindsym $mod+mod2+KP_7 	workspace 7
bindsym $mod+mod2+KP_8 	workspace 8
bindsym $mod+mod2+KP_9 	workspace 9

bindsym $mod+mod2+Shift+KP_Insert 	move container to workspace >, workspace >
bindsym $mod+mod2+Shift+KP_End 		move container to workspace 1, workspace 1
bindsym $mod+mod2+Shift+KP_Down 	move container to workspace 2, workspace 2
bindsym $mod+mod2+Shift+KP_Next 	move container to workspace 3, workspace 3
bindsym $mod+mod2+Shift+KP_Left 	move container to workspace 4, workspace 4
bindsym $mod+mod2+Shift+KP_Begin 	move container to workspace 5, workspace 5
bindsym $mod+mod2+Shift+KP_Right 	move container to workspace 6, workspace 6
bindsym $mod+mod2+Shift+KP_Home 	move container to workspace 7, workspace 7
bindsym $mod+mod2+Shift+KP_Up 		move container to workspace 8, workspace 8
bindsym $mod+mod2+Shift+KP_Prior 	move container to workspace 9, workspace 9

bindsym $mod+Ctrl+Left	move workspace to output left
bindsym $mod+Ctrl+Down	move workspace to output down
bindsym $mod+Ctrl+Up	move workspace to output up
bindsym $mod+Ctrl+Right	move workspace to output right

######################################################################## LAYOUT

bindsym $mod+Q kill

bindsym $mod+Left  focus left
bindsym $mod+Down  focus down
bindsym $mod+Up    focus up
bindsym $mod+Right focus right

bindsym $mod+Shift+Left  move left
bindsym $mod+Shift+Down  move down
bindsym $mod+Shift+Up    move up
bindsym $mod+Shift+Right move right

bindsym $mod+H split v
bindsym $mod+V split h

bindsym $mod+space floating toggle

bindsym $mod+F11 fullscreen toggle
bindsym $mod+P exec --no-startup-id "polybar-msg cmd toggle"

bindsym $mod+KP_Add            resize grow   width  5 px or 5 ppt
bindsym $mod+KP_Subtract       resize shrink width  5 px or 5 ppt
bindsym $mod+Shift+KP_Add      resize grow   height 5 px or 5 ppt
bindsym $mod+Shift+KP_Subtract resize shrink height 5 px or 5 ppt

######################################################################## APPLICATIONS

bindsym $mod+Return 	exec --no-startup-id "kitty"
bindsym $mod+F      	exec --no-startup-id "firefox"
bindsym $mod+R      	exec --no-startup-id "PATH=$PATH:~/.local/bin rofi -show run"
bindsym Mod1+Tab 		exec --no-startup-id "rofi -show window"
bindsym $mod+U 			exec --no-startup-id "ulauncher"
bindsym Print       	exec --no-startup-id "escrotum -sC"
bindsym $mod+Shift+X	exec --no-startup-id ".local/bin/powermenu"

######################################################################## MOCP CONTROL

bindsym $mod+F1			exec --no-startup-id "mocp -G"
bindsym $mod+F2			exec --no-startup-id "mocp -f"
bindsym $mod+Shift+F2	exec --no-startup-id "mocp -r"

######################################################################## AUTOSTART

exec_always --no-startup-id ".local/bin/fixx"
exec_always --no-startup-id "~/.fehbg"
exec_always --no-startup-id "killall polybar; .config/polybar/start.sh"
exec_always --no-startup-id "killall picom; picom"
exec_always --no-startup-id "otd-daemon"
exec --no-startup-id "buckle -s 1 -g 10"
exec --no-startup-id "fcitx -d"
exec --no-startup-id "mocp -S ~/.moc/playlist.m3u; mocp -o shuffle; mocp -p; mocp -P"

######################################################################## COLORS

set $bg					#1E1E1E
set $fg					#E1E1E1
set $border-focused		#D82E86
set $border-inactive	#82355D
set $border-unfocused	#632A4B
set $border-urgent		#3AB56B

client.focused          $border-focused		$bg $fg $border-focused		$border-focused
client.focused_inactive $border-inactive	$bg $fg $border-inactive	$border-inactive
client.unfocused        $border-unfocused	$bg $fg $border-unfocused	$border-unfocused
client.urgent           $border-urgent		$bg $fg $border-urgent		$border-urgent
client.placeholder      $bg $bg $fg $bg $bg
client.background       $bg

######################################################################## RULES

for_window [class="VirtualBox Machine"]	fullscreen enable

for_window [class="Qemu-system-x86_64"]	floating enable
for_window [class="Qemu-system-i386"] 	floating enable
