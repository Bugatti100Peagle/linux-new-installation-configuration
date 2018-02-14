# linux-new-installation-configuration
> Author: Bugatti100Peagle  Mail: 3443988515@qq.com
> Created Time: 2018年02月12日 星期一 13时32分55秒

linux从零安装到魔装

经常刷机，有时候有需要配置新的文件，所以写了这个，帮助自己和同样在刷机路上挣扎的朋友在刷机后迅速回到熟悉的操作环境。

## 安装



## 配置

1. VIM 配置
   ​

2. 输入法
   使用自带的输入法就好，虽然搜狗输入法功能丰富，但是在Ubuntu16.04 环境下经常出错异常，不如卸载啦干净。如果你实在喜欢搜狗拼音的话，可以参考[ubuntu安装配置搜狗拼音输入法](https://jingyan.baidu.com/article/a3aad71aa1abe7b1fa009641.html)安装，当你觉得它烦了的时候可以参考[ubuntu彻底卸载搜狗拼音输入法](https://jingyan.baidu.com/article/9faa723154c3dc473d28cb41.html) 

3. 字典词典
   [无道词典](https://github.com/ChestnutHeng/Wudao-dict) 命令行模式的词典，推荐与espeak联合使用.

4. QQ
   linux上没法用QQ,webQQ界面丑而且收发消息不及时。推荐使用命令行聊QQ[sjdy521](https://github.com/sjdy521)/**Mojo-Webqq**，安装依赖要`sudo` 

5. tmux

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

   ​