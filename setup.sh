#!/bin/sh
# script to setup software on fresh installation

#check if dropbox is installed
if [ ! -d "$HOME/Dropbox" ]; then
	echo "Please install dropbox to proceed further, enter yes to download it NOW"
	read download_dropbox
	if [ "$download_dropbox" = "yes" ]; then
		dropbox_download_url="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
		wget -P "$HOME/Downloads/" "$dropbox_download_url"
		echo "Please install dropbox from the file downloaded in the ~/Downloads folder"
	fi
else
	echo "Dropbox is installed."
fi

# Ask if want to install git
echo "Do you want to install GIT"
read install_git
if [ "$install_git" = "yes" ]; then
	sudo apt-get install git
fi

# Ask if want to install VIM 
echo "Do you want to install GVIM"
read install_vim
if [ "$install_vim" = "yes" ]; then
	sudo apt-get install vim-gtk3-py2
fi

if [ ! -d "$HOME/Downloads/fonts" ]; then
	mkdir "$HOME/Downloads/fonts"
	vim_airline_font_repo="https://github.com/powerline/fonts.git"
	git clone "$vim_airline_font_repo" "$HOME/Downloads/fonts/"

	mv ~/Downloads/fonts/* ~/.local/share/fonts/
	
	echo "Creating Symlinks to the VIM files"
	ln -s $HOME/Dropbox/dotfiles/vim $HOME/.vim
	ln -s $HOME/Dropbox/dotfiles/vimrc $HOME/.vimrc
else
	echo "The Vim Airline Fonts are installed"
fi
	
# Ask if you want to install Apache Server
echo "Do you want to install Apache Mysql PHP Server"
read install_apache
if [ "$install_apache" = "yes" ]; then
	sudo apt-get install apache2
	sudo apt-get install mysql-server
	sudo apt-get install php libapache2-mod-php
	sudo apt-get install php-mysql php-xml
	sudo service apache2 restart
	php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'
fi
