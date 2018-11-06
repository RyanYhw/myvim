#! /bin/bash

green='\e[0;32m'
GREEN='\e[1;32m'

yellow='\e[5;43m'
YELLOW='\e[1;33m'

red='\e[0;41m'
RED='\e[1;31m'

blue='\e[0;34m'
BLUE='\e[1;34m' 

None='\e[0m'


packages=( 
gcc 
g++ 
vim 
git
exuberant-ctags
cscope
python-pip
python3
cmake
wget
curl
)

update() {
    echo -e "${green}\tapt update start !!!${None}"
    sudo apt update
    if test $? -eq 0; then
        echo -e "${yellow}\tupdate success${None}"
    else
        echo -e "${RED}\tupdate error ${None}"
    fi

}

install_package () {
    if test $# -eq 0; then
        echo -e "${RED}\tapt install need param ${None}"
        exit
    fi
    echo -e "${green}\tapt install -y $@ start !!!${None}"

    sudo apt install -y $@

    if test $? -eq 0; then
        echo -e "${yellow}\t$@ install success${None}"
    else
        echo -e "${RED}\t$@ install error, please check ${None}"
        exit
    fi
}


command() {
    echo -e "${green}command $@ start !!!${None}"

    $@

    if test $? -ne 0; then 
        echo -e "${red}command $@ error, please check ${None}"
        exit
    else
        echo -e "${yellow}command $@ success${None}"
    fi
}

git_clone() {

    if test ! -d $2; then 
        command "mkdir -p $2"
        command "git clone $1 $2"
    fi
}

vim_install () {
    update
    for p in ${packages[@]}; do
        echo -e "${blue}$p${None}"
        tmp=$p
        
        echo $p | grep "ctags" -q
        if test $? -eq 0; then
            tmp="ctags"
        fi
        
        echo $p | grep "pip" -q
        if test $? -eq 0; then
            tmp="pip"
        fi

        type $tmp&>/dev/null
        if test $? -ne 0; then
            install_package $p
        else
            echo -e "${green}$p has already installed${None}"
        fi

    done

    command "pip install --user powerline-status"
    install_package fonts-powerline
    install_package python3-dev

    git_clone "https://github.com/gmarik/vundle.git" "${HOME}/.vim/bundle/vundle"

    
    command "cp ycm_extra_conf.py ${HOME}/.vim/.ycm_extra_conf.py"
    command "cp vimrc ${HOME}/.vimrc"
    command "cp vimrc.bundles ${HOME}/.vimrc.bundles"
    
    command "vim +PluginInstall +qall"

    #command "cd ${HOME}/.vim/bundle/YouCompleteMe "
    #command "python3 install.py --clang-completer "
    #command "cd -"
    
    git_clone "https://github.com/junegunn/fzf.git" "${HOME}/.fzf"
    command "${HOME}/.fzf/install"
}

vim_install 
