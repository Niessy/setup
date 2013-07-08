#!/bin/bash
##  Updates or install specified git bundles
##
##
# bundles to remove then update/install
git_bundles=(
    git://github.com/SirVer/ultisnips.git
    git://github.com/godlygeek/tabular.git
    git://github.com/groenewege/vim-less.git
    git://github.com/elzr/vim-json.git
    git://github.com/kchmck/vim-coffee-script.git
    git://github.com/kien/ctrlp.vim.git
    git://github.com/pangloss/vim-javascript.git
    git://github.com/scrooloose/nerdtree.git
    git://github.com/sickill/vim-pasta.git
    git://github.com/tomtom/tcomment_vim.git
    git://github.com/tpope/vim-fugitive.git
    git://github.com/tpope/vim-git.git
    git://github.com/tpope/vim-markdown.git
    git://github.com/tpope/vim-repeat.git
    git://github.com/tpope/vim-surround.git
)

cd $HOME/.vim/bundle

# fetch/add the bundles
for bundle in ${git_bundles[*]}; do
    package=`echo $bundle | cut -d '/' -f 5 | rev | cut -d '.' -f 2- | rev`
    if [[ -d $package ]]; then
        cd $package
        echo -e "Fetching latest for repo $package ... "
        git fetch
        cd ..
    else
        echo -e "Repo $package wasn't installed, installing ... "
        git clone $bundle
    fi
done

