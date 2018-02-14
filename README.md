# linux-new-installation-configuration
> Author: Bugatti100Peagle  Mail: 3443988515@qq.com
> Created Time: 2018年02月12日 星期一 13时32分55秒

# linux从零装到魔装

我经常刷机，有时候有需要配置新的文件，所以写了这个，帮助自己和同样在刷机路上挣扎的朋友在刷机后迅速回到熟悉的操作环境。

## 安装

1. 从U盘引导安装到笔记本，参考[Ubuntu 16.04 U盘安装图文教程](http://www.linuxidc.com/Linux/2016-04/130520.htm) 
   先准备好U盘，文中要求至少8G,我一般选用16G-USB-2.0做引导盘，安装的时候速度快，不会太过卡顿。因为我是直接刷单机的系统，所以直接点击清除磁盘就好了。准备刷双系统的请仔细查看分区。
2. 换主题，[Ubuntu 16.04下安装MacBuntu 16.04 TP 变身Mac OS X主题风格](http://www.linuxidc.com/Linux/2016-06/131947.htm),不过安装了这个主题后，会变得卡顿，所以我后来换用[Ubuntu 16.04主题美化和软件推荐](http://www.linuxidc.com/Linux/2016-09/135165.htm)推荐的Flatabulous主题。

## 配置

1. VIM 配置
   [超强vim配置文件](https://github.com/ma6174/vim-deprecated),照说明安装，然后对.vimrc文件作一下修改，或者直接复制仓库文件夹下的`vimbk`文件。我因为需要写fortran 程序所以也加入了识别f90的语句。我还加入了状态增强和批量注释的插件的插件。

   [vim插件: nerdcommenter[快速注释]](http://www.wklken.me/posts/2015/06/07/vim-plugin-nerdcommenter.html) 

   [vim插件: airline[状态栏增强] ](http://www.wklken.me/posts/2015/06/07/vim-plugin-airline.html) 

2. Sublime text 配置

   很少用，装汉化即可

2. 输入法
   使用自带的输入法就好，虽然搜狗输入法功能丰富，但是在Ubuntu16.04 环境下经常出错异常，不如卸载啦干净。如果你实在喜欢搜狗拼音的话，可以参考[ubuntu安装配置搜狗拼音输入法](https://jingyan.baidu.com/article/a3aad71aa1abe7b1fa009641.html)安装，当你觉得它烦了的时候可以参考[ubuntu彻底卸载搜狗拼音输入法](https://jingyan.baidu.com/article/9faa723154c3dc473d28cb41.html) 

4. 字典词典
   [无道词典](https://github.com/ChestnutHeng/Wudao-dict) 命令行模式的词典，推荐与espeak联合使用。下载安装后，替换文件夹下的`wdd`文件为仓库中`wudao-dict`文件夹下的`wdd`文件,为了方便自己复习之前查询的单词我还写了一个脚本`wd_words_list.sh`用于发送单词本到制定邮箱, 默认发送最近两次时间戳内的单词，`-a` 选项发送所有单词，有道单词支持导入`.txt`格式的词单文件，背单词从此so easy ! 需要提前配置sendmail

5. sendmail
   ​

4. QQ
   linux上没法用QQ,webQQ界面丑而且收发消息不及时。推荐使用命令行聊QQ[sjdy521/Mojo-Webqq](https://github.com/sjdy521/Mojo-Webqq)，安装依赖要`sudo` 

7. tmux

   分屏利器

   下载 `sudo apt-get install tmux`，卸载`sudo apt-get remove tmux`

   配置：

   - 在主目录下`vi ~/.tmux.conf` 加入如下代码

   - ```
     unbind C-b                 #删除快捷键Ctrl+b
     set -g prefix C-a          #启用快捷键Ctrl+a
     bind -n M-Left select-pane -L
     bind -n M-Right select-pane -R
     bind -n M-Up select-pane -U
     bind -n M-Down select-pane -D      #启用方向键切换pane
     set -g default-terminal "screen-256color"   #支持全色，与终端颜色一致

     # panes  面板的配色
     set -g pane-border-bg colour234
     set -g pane-border-fg colour234
     set -g pane-active-border-bg colour232
     set -g pane-active-border-fg colour223

     # statusbar   分割栏的配色
     set -g status-justify centre
     set -g status-bg colour235
     set -g status-fg colour248
     set -g status-attr dim

     # window   窗口配色
     setw -g window-status-current-fg colour223
     setw -g window-status-current-bg colour237
     setw -g window-status-current-attr bold
     setw -g window-status-current-format "#I:#W#F"
     ```

   - 然后，保存退出，终端中运行` tmux source-file .tmux.conf` ，再重新打开。

   使用：

   - 打开终端，输入`tmux` 

   - 垂直分屏`Ctrl + a + %` ,水平分屏`Ctrl + a + " ` 

   - 移动面板边框 `Ctrl + a`(长按)`+ 方向键` 

   - 切换面板 `Ctrl + a`(短按)`+ 方向键` ，或 `Ctrl + a + q ` ，显示面板序号，输入数字切换(动作要快，在数字消失之前切换)

   - `ctrl + a + [` 激活鼠标滚屏，`q`退出滚屏

   - `ctrl + a + {`向前置换当前面板

   - `ctrl + a + ?` 查看所有切换键

     ![tmux使用示范](./pictures/tmux_1.png)

     因为使用tmux 就是为了不用鼠标切换窗口，所以我没有加入鼠标分屏的配置。关于tmux的配置可参考[tmux Tutorial — Split Terminal Windows Easily](https://lukaszwrobel.pl/blog/tmux-tutorial-split-terminal-windows-easily/)，[Linux终端复用神器-Tmux使用梳理](http://www.cnblogs.com/kevingrace/p/6496899.html)和[tmux的使用方法和个性化配置](http://blog.csdn.net/robertbaker/article/details/42172203) 

8. op 自定义打开网页的命令 [linux_op](./op/linux_op.md)