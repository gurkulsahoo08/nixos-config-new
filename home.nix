{ config, pkgs, ...}:

{


	home.username = "gurkul";
	home.homeDirectory = "/home/gurkul";
	home.stateVersion = "26.05";

	programs.fish.enable = true;
	programs.git.enable = true;
	programs.git.settings.user.name = "Gurkul Sahoo";
	programs.git.settings.user.email = "gurkulsahoo47@gmail.com";
	programs.gpaste.enable = true;
	# Tmux
	programs.tmux = {
		enable = true;
		prefix = "C-a";
		mouse = true;
		baseIndex = 1;
		keyMode = "vi";
		terminal = "tmux-256color";
		sensibleOnTop = false;
		extraConfig = ''
			set -ga terminal-overrides ",*:RGB"
			set -g set-clipboard on
			set -g status-style bg=default,fg=white

			unbind %
			unbind '"'
			bind | split-window -h -c "{#pane_current_path}"
			bind - split-window -v -c "{#pane_current_path}"

			unbind r
			bind r source-file $HOME/.config/tmux/tmux.conf

			set -g pane-base-index 1
			set-window-option -g renumber-windows on

			bind -n S-Left previous-window
			bind -n S-Right next-window

			bind -n M-d select-pane -L
			bind -n M-s select-pane -D
			bind -n M-w select-pane -U
			bind -n M-a select-pane -R

			bind -n M-1 select-window -t 1
			bind -n M-2 select-window -t 2
			bind -n M-3 select-window -t 3
			bind -n M-4 select-window -t 4
			bind -n M-5 select-window -t 5
			bind -n M-6 select-window -t 6
			bind -n M-7 select-window -t 7
			bind -n M-8 select-window -t 8
			bind -n M-9 select-window -t 9

			bind-key -T copy-mode-vi v send-keys -X begin-selection
			bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
			bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
			bind-key -T copy-mode-vi MouseDragEnd1Pane
			       '';
};


	home.packages = with pkgs; [
		gdu
		fastfetch
		tmux
		htop
		ptyxis
		aria2
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
		tmux
		wl-clipboard
		hugo
		gnome-tweaks
];









}
