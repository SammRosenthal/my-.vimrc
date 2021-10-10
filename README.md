# My .vimrc


* Install vim-plug to handle your plugins - Use the curl version of the install for windows in a bash shell
    * https://github.com/junegunn/vim-plug
* Install the tools below to remap escape and caps lock
    * https://www.randyrants.com/category/sharpkeys/ - this is for windows
    * https://karabiner-elements.pqrs.org/ - this is for mac
    
* Key remap for Ubuntu
   * https://askubuntu.com/questions/24916/how-do-i-remap-certain-keys-or-devices
   * this is better -> 
      * add ```setxkbmap -option caps:swapescape``` to your startup programs
   * keychron f key fix
      * echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode 
      * echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
      * restart comp

* Install the following:
    * git
    * nodejs
    * npm
    * neovim

* Paste the contens of the .vimrc file in this repo to "~/.vimrc" on your machine
* Install plugins by running :PlugInstall

* Currently supports these languages:
    * Javascript
    * Node
    * React
    * Vue
    * Python
    * css/sass
    * C++
* for typescript support on linux environment use this
   * git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim
