# vimrc

## 安装步骤

需要重新编译部分插件 `ycm`等..

```

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vi 

BundleInstall

```


依赖安装
```
# ubuntu
sudo apt-get install ctags
sudo apt-get install build-essential cmake python-dev  #编译YCM自动补全插件依赖
sudo apt-get install silversearcher-ag

# centos
sudo yum install python-devel.x86_64
sudo yum groupinstall 'Development Tools'
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install the_silver_searcher
sudo yum install cmake

# mac
brew install ctags
brew install the_silver_searcher

```
