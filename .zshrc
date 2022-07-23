# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/braxton/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	rust
	colored-man-pages
	extract
	git
	npm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

alias ls='ls --color=auto'
alias grep='rg -p -P'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias np='nano -w PKGBUILD'
alias more=less

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

export LS_COLORS="ow=1;32;40"

PATH=/home/braxton/git/gcc4mbed/gcc-arm-none-eabi/bin:$PATH
PATH=/home/braxton/.cargo/bin:$PATH
PATH=/home/braxton/.dub/packages/.bin/dls-latest:$PATH
PATH=/home/braxton/.local/share/code-d/bin:$PATH
PATH=/home/braxton/goneovim:$PATH
PATH=/home/braxton/.nvm/versions/node/v17.7.2/bin:$PATH
PATH=/home/braxton/.local/share/gem/ruby/2.7.0:$PATH
PATH=/var/lib/gems/2.7.0:$PATH
PATH=/home/braxton/JUCE/extras/AudioPluginHost/Builds/LinuxMakefile/build:$PATH
PATH=/home/braxton/.local/bin/:$PATH
PATH=/home/braxton/git/vcpkg/:$PATH
export PATH

PICO_SDK_PATH=/home/braxton/git/pico/pico-sdk
export PICO_SDK_PATH

JUCE_DIR="$HOME/JUCE_CMAKE"
export JUCE_DIR

CMAKE_PREFIX_PATH=/home/braxton/JUCE_CMAKE:/home/braxton/git/Apex/dependencies/GSL_CMAKE:$CMAKE_PREFIX_PATH:$PATH
export CMAKE_PREFIX_PATH

export GCC4MBED_DEPLOY='cp PROJECT.bin /run/media/braxton/MBED/'

export DOCKER_HOST="tcp://localhost:4243"

alias ssh-google-cloud='ssh 104.198.173.158 -X -l braxtonsalyer'
alias sshfs-google-cloud='sshfs braxtonsalyer@104.198.173.158:/ ~/remote-dev/os-salyer-braxton-1'
alias cat=bat
alias ls="exa -l --icons --all --group-directories-first --git"
alias vim=nvim
alias gvim=goneovim
#alias gvim="nvui --ext_multigrid --ext_popupmenu --ext_cmdline --"
alias emacs='emacs -nw'
alias json2cmakelists="python3 ~/git/json2cmakelists/json2cmakelists.py"
alias sudo='sudo '
alias cmake_release='cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=linux-clang.cmake -DCMAKE_BUILD_TYPE=Release && yes | cp -f build/compile_commands.json compile_commands.json'
alias cmake_release_gcc='cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=linux-gcc.cmake -DCMAKE_BUILD_TYPE=Release && yes | cp -f build/compile_commands.json compile_commands.json'
alias cmake_debug='cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=linux-clang.cmake -DCMAKE_BUILD_TYPE=Debug && yes | cp -f build/compile_commands.json compile_commands.json'
alias cmake_debug_gcc='cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=linux-gcc.cmake -DCMAKE_BUILD_TYPE=Debug && yes | cp -f build/compile_commands.json compile_commands.json'

alias cmake_release_juce='cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=linux-clang.cmake -DCMAKE_BUILD_TYPE=Release -DVST2_SDK_PATH=/home/braxton/seagate/audio-dev/sdks/VST_SDK/VST2_SDK && yes | cp -f build/compile_commands.json compile_commands.json'
alias cmake_release_gcc_juce='cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=linux-gcc.cmake -DCMAKE_BUILD_TYPE=Release -DVST2_SDK_PATH=/home/braxton/seagate/audio-dev/sdks/VST_SDK/VST2_SDK && yes | cp -f build/compile_commands.json compile_commands.json'
alias cmake_debug_juce='cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=linux-clang.cmake -DCMAKE_BUILD_TYPE=Debug -DVST2_SDK_PATH=/home/braxton/seagate/audio-dev/sdks/VST_SDK/VST2_SDK && yes | cp -f build/compile_commands.json compile_commands.json'
alias cmake_debug_gcc_juce='cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=linux-gcc.cmake -DCMAKE_BUILD_TYPE=Debug -DVST2_SDK_PATH=/home/braxton/seagate/audio-dev/sdks/VST_SDK/VST2_SDK && yes | cp -f build/compile_commands.json compile_commands.json'

alias clippy='~/clippy_alias.sh'

alias build='./build.sh'
alias test='./test.sh'
alias build_and_test='./build.sh && ./test.sh'
alias clean='./clean.sh'
alias clean_build='./clean.sh && ./build.sh'
alias clean_build_and_test='./clean.sh && ./build.sh && ./test.sh'

alias onivim="/home/braxton/Onivim/usr/bin/Oni2"

alias -s c=nvim
alias -s cpp=nvim
alias -s h=nvim
alias -s rs=nvim
alias -s toml=nvim
alias -s json=nvim
alias -s d=nvim
alias -s txt=nvim
alias -s text=nvim
alias -s html=nvim
alias -s js=nvim
alias -s ts=nvim
alias -s java=nvim
alias -s sql=nvim

alias .vimrc="nvim .vimrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export HDOC_PROJECT_API_KEY=9qUFEPM5.wwfPILGV1ylTrmPitgkAwWiYOngxAQz2

VISUAL=nvim
EDITOR="$VISUAL"
export VISUAL
export EDITOR

#  xmake completion
export XMAKE_ROOTDIR="/usr/bin"
export PATH="$XMAKE_ROOTDIR:$PATH"
[[ -s "/usr/share/xmake/scripts/profile-unix.sh" ]] && source "/usr/share/xmake/scripts/profile-unix.sh"
#  xmake completion
