#!/bin/sh
myDir=`pwd`
home=$HOME

addLink()
{
    if [ -F $home/$1 ]; then
        echo "Deleting link $home/$1 so it can be replaced..."
        rm $home/$1
    fi
    if [ -f $home/$1 ] || [ -d $home/$1 ]; then
        echo "$home/$1 already exists"
    elif [ ! -f $myDir/$1 ] && [ ! -d $myDir/$1 ]; then
        echo "$myDir/$1 is not a file or directory"
    else
        echo "Adding $1"
        if [ -z "$2" ]; then
            ln -s $myDir/$1 $home/$1
        else
            ln -s $myDir/$1 $home/$2
        fi
    fi
}
# main
# # eventually needs full argument handling: only add certain things;
# # remove .bashrc, etc.
if [ "$1" = "--server" ] || [ "$1" = "--mac" ]; then
    # if server then connect up .bashrc-server and .vimrc-server
    if [ $1 = "--server" ]; then
        addLink ".bashrc-server" ".bashrc"
        addLink ".vimrc-server" ".vimrc"
    else
    # else connect up .bash_profile-maxosx and .vimrc-macvim
        addLink ".bash_profile-maxosx" ".bash_profile"
        addLink ".vimrc-macvim" ".vimrc"
    fi
    addLink ".bash_prompt_colors"
    addLink ".ctags"
    addLink ".dircolors"
    # addLink ".editorconfig" # ?? for vim-jsbeautify
    addLink ".git_template"
    addLink ".gitconfig"
    addLink ".vim"
    addLink "bin"
else
    echo "Please supply either --server or --mac as the first parameter"
    echo "$1"
fi
