# my-.vimrc


need to install vundle on your machine command below

-- git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

.vimrc file goes in ~/ directory

after gettting vundle go to terminal and type

"vim ~/.vimrc" and paste the contents of this repo in it

Install the plugins by running in teh .vimrc file :PluginInstall

Vim 8 on Unix
- mkdir -p ~/.vim/pack/git-plugins/start
- git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale

to get auto complete working you need to install your language plugin below:
  :CocInstall coc-java
  :CocInstall coc-python
  :CocInstall coc-tsserver --> this is js and ts
  
  
  
