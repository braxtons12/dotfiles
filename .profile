# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi


JUCE_DIR="$HOME/JUCE_CMAKE"
export JUCE_DIR

CMAKE_PREFIX_PATH=/home/braxton/JUCE_CMAKE:/home/braxton/git/Apex/dependencies/GSL_CMAKE:$CMAKE_PREFIX_PATH:$PATH
export CMAKE_PREFIX_PATH

export PATH="/usr/lib/go-1.15/bin:$PATH"

export PATH="/home/braxton/.nvm/versions/node/v15.14.0/bin:$PATH"

PICO_SDK_PATH=/home/braxton/git/pico/pico-sdk
export PICO_SDK_PATH
. "$HOME/.cargo/env"

XMAKE_PROGRAM_DIR=/usr/share/xmake
export XMAKE_PROGRAM_DIR


# Added by Toolbox App
export PATH="$PATH:/home/braxton/.local/share/JetBrains/Toolbox/scripts"

