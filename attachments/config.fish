#
#         :::   :::  ::::::::::::::    :::    :::
#       :+:+: :+:+:     :+:    :+:   :+:   :+: :+:
#     +:+ +:+:+ +:+    +:+    +:+  +:+   +:+   +:+  Irfan Hakim (MIKA)
#    +#+  +:+  +#+    +#+    +#++:++   +#++:++#++:  https://sakurajima.social/@irfan
#   +#+       +#+    +#+    +#+  +#+  +#+     +#+   https://github.com/irfanhakim-as
#  #+#       #+#    #+#    #+#   #+# #+#     #+#    https://gitlab.com/irfanhakim
# ###       #################    ######     ###
#
# fish-config: initially based on DistroTube's fish config in DTOS.


### ADDING TO THE PATH
# First line removes the path; second line sets it.
# Without the first line, your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/podman/bin $fish_user_paths
set -U fish_user_paths /usr/bin $HOME/Applications $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths


### EXPORTS ###
# System
set fish_greeting                                                                                               # Supresses fish's intro message
set TERM "xterm-256color"                                                                                      # Sets the terminal type
set -x GPG_TTY (tty)                                                                                           # Sets the GPG_TTY variable

# Editors
set -x GIT_EDITOR "/usr/bin/nano"                                                                              # $GIT_EDITOR use nano as default git editor
set -x KUBE_EDITOR "/usr/bin/vim"                                                                              # $KUBE_EDITOR use vim as default kubectl editor
set -x KUBECONFIG "$HOME/.kube/config"                                                                          # Sets the system's default kubeconfig
# set EDITOR "emacsclient -t -a ''"                                                                              # $EDITOR use Emacs in terminal
# set VISUAL "emacsclient -c -a emacs"                                                                           # $VISUAL use Emacs in GUI mode

# Container runtime
# set -x CONTAINER_RUNTIME "docker"                                                                              # Sets the system's default container runtime to docker
set -x CONTAINER_RUNTIME "podman"                                                                              # Sets the system's default container runtime to podman

# Credentials
# set -x GH_USERNAME "ghuser"                                                                                    # Sets the user's GitHub username
# set -x GH_EMAIL "ghuser@example.com"                                                                           # Sets the user's GitHub email
# set -x GH_RW_TOKEN "ghp_e5JnBWZqJW0yvJLHi2ror5mghVIosFtdYXe8"                                                  # Sets the user's GitHub read/write token
# set -x GH_RO_TOKEN "ghp_2mWLfT8spt2ZkClxHlciqPMTQNmC5lqHAeUQ"                                                  # Sets the user's GitHub read-only token
# set -x ORG_GH_USERNAME "orgghuser"                                                                             # Sets the organisation's GitHub username
# set -x ORG_GH_TOKEN "ghp_bG3obBhNjDWUj2PRUR6DgY2qLuIPb517Lkde"                                                 # Sets the organisation's GitHub token
# set -x GL_USERNAME "gluser"                                                                                    # Sets the user's GitLab username
# set -x GL_EMAIL "gluser@example.com"                                                                           # Sets the user's GitLab email
# set -x GL_RW_TOKEN "glpat-Bo2190iNPLhVqq14uo41"                                                                # Sets the user's GitLab read/write token
# set -x GL_RO_TOKEN "glpat-Wr7m72jSq0gHpyWLjtBm"                                                                # Sets the user's GitLab read-only token
### END OF EXPORTS ###


### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"


### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  fish_default_key_bindings
  # fish_vi_key_bindings
end
### END OF VI MODE ###


### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan
### END OF AUTOCOMPLETE AND HIGHLIGHT COLORS ###


### SPARK ###
set -g spark_version 1.0.0

complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
complete -xc spark -n __fish_use_subcommand -a --min -d "Minimum range value"
complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"

function spark -d "sparkline generator"
    if isatty
        switch "$argv"
            case {,-}-v{ersion,}
                echo "spark version $spark_version"
            case {,-}-h{elp,}
                echo "usage: spark [--min=<n> --max=<n>] <numbers...>  Draw sparklines"
                echo "examples:"
                echo "       spark 1 2 3 4"
                echo "       seq 100 | sort -R | spark"
                echo "       awk \\\$0=length spark.fish | spark"
            case \*
                echo $argv | spark $argv
        end
        return
    end

    command awk -v FS="[[:space:],]*" -v argv="$argv" '
        BEGIN {
            min = match(argv, /--min=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
            max = match(argv, /--max=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
        }
        {
            for (i = j = 1; i <= NF; i++) {
                if ($i ~ /^--/) continue
                if ($i !~ /^-?[0-9]/) data[count + j++] = ""
                else {
                    v = data[count + j++] = int($i)
                    if (max == "" && min == "") max = min = v
                    if (max < v) max = v
                    if (min > v ) min = v
                }
            }
            count += j - 1
        }
        END {
            n = split(min == max && max ? "▅ ▅" : "▁ ▂ ▃ ▄ ▅ ▆ ▇ █", blocks, " ")
            scale = (scale = int(256 * (max - min) / (n - 1))) ? scale : 1
            for (i = 1; i <= count; i++)
                out = out (data[i] == "" ? " " : blocks[idx = int(256 * (data[i] - min) / scale) + 1])
            print out
        }
    '
end
### END OF SPARK ###


### FUNCTIONS ###
# Spark functions
function letters
    cat $argv | awk -vFS='' '{for(i=1;i<=NF;i++){ if($i~/[a-zA-Z]/) { w[tolower($i)]++} } }END{for(i in w) print i,w[i]}' | sort | cut -c 3- | spark | lolcat
    printf  '%s\n' 'abcdefghijklmnopqrstuvwxyz'  ' ' | lolcat
end

function commits
    git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' | spark | lolcat
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ $fish_key_bindings = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end

# Function for org-agenda
function org-search -d "send a search string to org-mode"
    set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        (mapcar #'org-link-display-format \
        (org-ql-query \
        :select #'org-get-heading \
        :from  (org-agenda-files) \
        :where (org-ql--query-string-to-sexp \"$argv\"))) \
        \"
    \"))")
    printf $output
end

# Function for running the command in host if command is not found in container
function fish_command_not_found
    # "In a container" check
    if test -e /run/.containerenv -o -e /.dockerenv
        distrobox-host-exec $argv
    else
        __fish_default_command_not_found_handler $argv
    end
end

# Function for setting the title of the terminal
function fish_title
    set -q argv[1]; or set argv fish
    set -g __fish_prompt_hostname (cat /etc/hostname)
    # set -g __fish_prompt_hostname (hostname)
    echo "$USER"@"$__fish_prompt_hostname": (fish_prompt_pwd_dir_length=1 prompt_pwd);
end
### END OF FUNCTIONS ###


### ALIASES ###
# `clear`
alias clear='/usr/bin/clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'
# alias clear='/usr/bin/clear; echo; echo; seq 1 (tput cols) | sort -R | spark ; echo; echo'

# Root privileges
alias doas='doas --'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# `vim` and `emacs`
alias vi='vim'
# alias em='/usr/bin/emacs -nw'
# alias emacs="emacsclient -c -a 'emacs'"
# alias doomsync="~/.emacs.d/bin/doom sync"
# alias doomdoctor="~/.emacs.d/bin/doom doctor"
# alias doomupgrade="~/.emacs.d/bin/doom upgrade"
# alias doompurge="~/.emacs.d/bin/doom purge"

# Changing `ls` to `eza`
alias ls='eza -al --color=always --group-directories-first'                                                    # preferred listing
alias la='eza -a --color=always --group-directories-first'                                                     # all files and dirs
alias ll='eza -l --color=always --group-directories-first'                                                     # long format
alias lt='eza -aT --color=always --group-directories-first'                                                    # tree listing
alias l.='eza -a | egrep "^\."'

# `arch-wiki-lite`
# alias rtfm='wiki-search'                                                                                       # search arch-wiki-docs

# Package manager
alias pacsyu='sudo pacman -Syyu'                                                                               # update only standard pkgs
alias yaysua='yay -Sua'                                                                                        # update only AUR pkgs (yay)
alias yaysyu='yay -Syu'                                                                                        # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua'                                                                                       # update only AUR pkgs (paru)
alias parsyu='paru -Syu'                                                                                       # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'                                                                  # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'                                                                # remove orphaned packages
alias yayss='yay -Ss'                                                                                          # search standard pkgs and AUR pkgs (yay)
alias yayi='yay -Ql'                                                                                           # get info about standard pkgs and AUR pkgs (yay)
alias yays='yay -S'                                                                                            # install standard pkgs and AUR pkgs (yay)
alias yaysy='yay -S --noconfirm'                                                                               # force install standard pkgs and AUR pkgs (yay)
alias yayr='yay -Rns'                                                                                          # remove standard pkgs and AUR pkgs (yay)
alias yayry='yay -Rns --noconfirm'                                                                             # force remove standard pkgs and AUR pkgs (yay)
alias backpac='pacman -Qqe | grep -v "(pacman -Qqm)" > ~/packages.lst'                                         # put all installed packages in a list
alias respac='cat ~/packages.lst | xargs yay -S --needed --noconfirm'                                          # install all backpac-ed packages
alias backpak='flatpak list --columns=application > ~/flatpak.lst'                                             # put all installed flatpaks in a list
alias respak='cat ~/flatpak.lst | xargs flatpak install -y --or-update'                                        # install all backpak-ed packages

# `helm`
# alias helmsyu='helm repo update'                                                                               # update helm repos
# alias helmsy='helm upgrade --install --wait'                                                                   # upgrade or install helm chart
# alias helmr='helm uninstall --wait'                                                                            # uninstall helm chart
# alias helmss='helm search repo'                                                                                # search helm repo
# alias helml='helm lint'                                                                                        # lint helm chart
# alias helmls='helm ls -n'                                                                                      # list helm releases
# alias helmi='helm show all'                                                                                    # get info about helm chart

# `distrobox`
alias dbc='distrobox create'                                                                                   # create container
alias dbe='distrobox enter -nw'                                                                                # enter container in home directory
alias dbl='distrobox list'                                                                                     # list containers
alias dbr='distrobox rm'                                                                                       # remove container
alias dbs='distrobox stop'                                                                                     # stop container
alias dbx='distrobox-host-exec'                                                                                # execute command on host from the container
alias dbxa='distrobox-export --app'                                                                            # export app from container to host
alias dbxb='distrobox-export --bin'                                                                            # export bin from container to host
alias dbxd='distrobox-export --delete'                                                                         # delete exported app/bin/service from host
alias dbxs='distrobox-export --service'                                                                        # export service from container to host

# Get fastest mirrors
# alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
# alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
# alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
# alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'

# Colourise grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Adding flags
alias df='df -h'                                                                                               # human-readable sizes
alias free='free -m'                                                                                           # show sizes in MB

# `ps`
alias psa='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# `git`
alias add='git add'
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch -a'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias pushc='git push -u origin HEAD'
alias tag='git tag'
alias newtag='git tag -a'
alias log='git log --oneline --decorate --graph'
alias acopu='git add --all && git commit && git push -u origin HEAD'
alias commitp='git commit -p'
alias delbrarem='git push -d origin'
alias delbraloc='git branch -D'
alias statusg='git status'
alias prune='git remote prune origin'

# Get error messages from `journalctl`
alias jctl='journalctl -p 3 -xb'

# `gpg` encryption
# Verify signature for isos
alias gpg-check='gpg2 --keyserver-options auto-key-retrieve --verify'
# Receive the key of a developer
alias gpg-retrieve='gpg2 --keyserver-options auto-key-retrieve --receive-keys'

# `yt-dlp`
# alias yta-aac='yt-dlp --extract-audio --audio-format aac'
# alias yta-best='yt-dlp --extract-audio --audio-format best'
# alias yta-flac='yt-dlp --extract-audio --audio-format flac'
# alias yta-m4a='yt-dlp --extract-audio --audio-format m4a'
# alias yta-mp3='yt-dlp --extract-audio --audio-format mp3'
# alias yta-opus='yt-dlp --extract-audio --audio-format opus'
# alias yta-vorbis='yt-dlp --extract-audio --audio-format vorbis'
# alias yta-wav='yt-dlp --extract-audio --audio-format wav'
# alias ytv-best='yt-dlp -f bestvideo+bestaudio'

# Switch between shells
# Switching default SHELL from `bash` is not recommended
alias tobash='sudo chsh $USER -s /bin/bash && echo "Now log out."'
alias tozsh='sudo chsh $USER -s /bin/zsh && echo "Now log out."'
alias tofish='sudo chsh $USER -s /bin/fish && echo "Now log out."'

# Bare `git` repo alias for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# `termbin`
alias tb='nc termbin.com 9999'

# Terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# `neofetch`
alias neo='neofetch'

# `python`
alias venv='virtualenv venv'

# `nano`
alias nano='nano -l'

# `kubectl`
# alias k='kubectl'

# `vscode`
# alias c='flatpak run com.visualstudio.code'
# alias c='code'

# `rsync`
alias smv='rsync -avz --remove-source-files -e ssh'

# container registry authentication
# alias ghlogin='echo $GH_RW_TOKEN | $CONTAINER_RUNTIME login ghcr.io -u $GH_USERNAME --password-stdin'
# alias gllogin='echo $GL_RW_TOKEN | $CONTAINER_RUNTIME login registry.gitlab.com -u $GL_USERNAME --password-stdin'
# alias ghgenrosec='kubectl create secret docker-registry ghcr-token-secret --docker-server=https://ghcr.io --docker-username="$GH_USERNAME" --docker-password="$GH_RO_TOKEN" --docker-email="$GH_EMAIL"'
# alias glgenrosec='kubectl create secret docker-registry gitlab-token-secret --docker-server=https://registry.gitlab.com --docker-username="$GL_USERNAME" --docker-password="$GL_RO_TOKEN" --docker-email="$GL_EMAIL"'
### END OF ALIASES ###


### SETUP ###
# Random colour script
if status is-interactive
    colorscript random
end

# Setting tmux if not already
# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end

# if status is-interactive
#     # >>> conda initialize >>>
#     # !! Contents within this block are managed by 'conda init' !!
#     if test -f ~/miniconda3/bin/conda
#         eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
#     end
#     # <<< conda initialize <<<
# end

# start podman machine on macos if not running
# if status is-interactive
#     if command -v podman >/dev/null
#         # check if podman machine is running
#         set machine_info (podman machine info)
#         if ! string match -q "*machinestate: Running*" $machine_info
#             # start podman machine quietly
#             podman machine start >/dev/null 2>&1
#         end
#     end
# end

# Setting starfish prompt
starship init fish | source
### END OF SETUP ###