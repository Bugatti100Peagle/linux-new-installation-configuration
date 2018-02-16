# tmux 分屏利器
> Author: Bugatti100Peagle  Mail: 3443988515@qq.com
> Created Time: 2018年02月16日 星期五 21时54分46秒


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

  ![tmux使用示范](../pictures/tmux_1.png)

  因为使用tmux 就是为了不用鼠标切换窗口，所以我没有加入鼠标分屏的配置。关于tmux的配置可参考[tmux Tutorial — Split Terminal Windows Easily](https://lukaszwrobel.pl/blog/tmux-tutorial-split-terminal-windows-easily/)，[Linux终端复用神器-Tmux使用梳理](http://www.cnblogs.com/kevingrace/p/6496899.html)和[tmux的使用方法和个性化配置](http://blog.csdn.net/robertbaker/article/details/42172203) 
