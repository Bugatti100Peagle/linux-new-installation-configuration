# linux-new-installation-configuration
> Author: Bugatti100Peagle  Mail: 3443988515@qq.com
> Created Time: 2018年02月12日 星期一 13时32分55秒

# linux从零装到魔装

我经常刷机，有时候有需要配置新的文件，所以写了这个，帮助自己和同样在刷机路上挣扎的朋友在刷机后迅速回到熟悉的操作环境。

[TOC]

## 安装

1. 从U盘引导安装到笔记本，参考[Ubuntu 16.04 U盘安装图文教程](http://www.linuxidc.com/Linux/2016-04/130520.htm) 
   先准备好U盘，文中要求至少8G,我一般选用16G-USB-2.0做引导盘，安装的时候速度快，不会太过卡顿。因为我是直接刷单机的系统，所以直接点击清除磁盘就好了。准备刷双系统的请仔细查看分区。
2. 换主题，[Ubuntu 16.04下安装MacBuntu 16.04 TP 变身Mac OS X主题风格](http://www.linuxidc.com/Linux/2016-06/131947.htm),不过安装了这个主题后，会变得卡顿，所以我后来换用[Ubuntu 16.04主题美化和软件推荐](http://www.linuxidc.com/Linux/2016-09/135165.htm)推荐的Flatabulous主题。

## 配置

### 1. VIM配置 

[超强vim配置文件](https://github.com/ma6174/vim-deprecated),照说明安装，然后对.vimrc文件作一下修改，或者直接复制仓库文件夹下的`vimbk`文件。我因为需要写fortran 程序所以也加入了识别f90的语句。我还加入了状态增强和批量注释的插件的插件。

批量注释

1. control+V进入VISUAL BLOCK模式，按j或k选中多行

2. 按shift+i（大写I），输入注释符（#或//），按一下或者两下Esc，完成注释

批量反注释

1. control+V进入VISUAL  BLOCK模式，按j或k选中多行，按l选中多列
2. 按x或者d删除注释。

[vim插件: airline[状态栏增强] ](http://www.wklken.me/posts/2015/06/07/vim-plugin-airline.html) 

### 2. Sublime text 配置

很少用，装汉化即可

### 3. 输入法

使用自带的输入法就好，虽然搜狗输入法功能丰富，但是在Ubuntu16.04 环境下经常出错异常，不如卸载啦干净。如果你实在喜欢搜狗拼音的话，可以参考[ubuntu安装配置搜狗拼音输入法](https://jingyan.baidu.com/article/a3aad71aa1abe7b1fa009641.html)安装，当你觉得它烦了的时候可以参考[ubuntu彻底卸载搜狗拼音输入法](https://jingyan.baidu.com/article/9faa723154c3dc473d28cb41.html) 

### 4. 字典词典

[无道词典](https://github.com/ChestnutHeng/Wudao-dict) 命令行模式的词典，推荐与espeak联合使用。下载安装后，替换文件夹下的`wdd`文件为仓库中`wudao-dict`文件夹下的`wdd`文件,为了方便自己复习之前查询的单词我还写了一个脚本`wd_words_list.sh`用于发送单词本到制定邮箱, 默认发送最近两次时间戳内的单词，`-a` 选项发送所有单词，有道单词支持导入`.txt`格式的词单文件，背单词从此so easy ! 需要提前配置sendmail。有时候，邮箱会把邮件错认为垃圾邮件，请到邮件垃圾箱或着被拒邮件中找一找。发送到QQ邮箱会比较慢。

![邮件效果](./pictures/wds_1.jpg)



### 5. mail

下载：`sudo apt-get install mailx`,然后关闭sendmail 服务`service sendmail stop ` ,以根用户配置`/etc/mail.rc` 加入

``` 
set from=用户名@126.com
set smtp=smtp.126.com
set smtp-auth-user=用户名
set smtp-auth-password=客户端授权码，不是邮箱登陆密码
set smtp-auth=login
```

重启服务，发送一封测试邮件。

`echo "邮件正文" | mail -s "邮件主题" 收件人@qq.com` 
> ?Centos 服务器下配置十分麻烦

### 6. QQ

linux上没法用QQ,webQQ界面丑而且收发消息不及时。推荐使用命令行聊QQ[sjdy521/Mojo-Webqq](https://github.com/sjdy521/Mojo-Webqq)，安装依赖要`sudo` ,IRC聊天室可以使用`irssi  -c 127.0.0.1 -P 6667` 或者*雷鸟*的聊天功能，设置端口为6667, 禁用SSL. 

```
雷鸟：保存联系人 直接复制其名称到新建联系人窗口即可
```

### 7.[tmux分屏利器](./tmux/tmux.md)

![tmux](./pictures/tmux_1.png)


### 8. op 自定义打开网页的命令 [linux_op](./op/linux_op.md)

### 9. ArcTime 字幕压制软件

因为英语学习的需要，所以需要自己压制一些字幕文件用于复读学习，手机上配合点滴复读机使用，背英语简直不能太享受。

### 10. 火狐浏览器

Chrome浏览器不是预装的，而且国内环境限制，火狐更快一点。浏览器必装插件：

- Yeekit网页翻译
- Zotero 网页插件
- 印象笔记.剪藏
- [常用网页](./common_web_pages.md)

### 11. Sigil Epub阅读器

[Ubuntu下安装ePub编辑器 Sigil](https://www.linuxidc.com/Linux/2012-12/75833.htm) 实际上，它还可以编辑epub文件，如果你Html学得够好的话。

### 12. git 搭建服务器，同步目录到网页
1. 安装git: 
```
yum -y install git
```

2. 配置git，参考[廖雪峰的git教程·安装git](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/00137396287703354d8c6c01c904c7d9ff056ae23da865a000) 

3. 创建仓库，提交代码，略

4. 在服务器上搭建git，创建自己的`github` 服务，参考[Git推送到服务器自动同步到站点目录](https://www.linuxidc.com/Linux/2017-05/143313.htm) 和 [云中沙箱 - 基于阿里云的IT实验平台](https://edu.aliyun.com/lab/courses/129136057c2a4d50af22490b5ce8f878/detail?purchaseRecordId=5718e0756dca40eb88c53d3c09a02233) 

   ```bash
   ### 下载安装apache  ###
   $ yum -y install httpd
   $ adduser -d /var/www/html 用户名   #创建用于管理网页的用户
   $ passwd 用户名                     #设置密码
   $ chown -Rf 用户名:用户组(默认是用户名) /var/www/html
   $ service httpd start              #启动Apache服务
   ###  打开浏览器，输入服务器公网IP,若显示 ‘ Apache 2 Test Page ' 则部署成功

   ### 部署git 服务 ，请先确保git已安装###
   #### 创建裸版本库，用于git拉取 ####
   $ mkdir /home/用户名或目录名 #名字不重要，自己好记即可
   $ cd /home/刚刚那个目录  
   $ git init --bare 仓库名.git #注意bare前是双杠，仓库名随意，但注意以 .git 结尾

   ### 至此git服务已搭建好，本地拉取只要用
   $ git clone ssh://用户名@服务器IP:端口号/XXX/仓库名.git  
   #注意此处的用户名应是仓库文件夹的所属，若原本用root账户创建的，可使用chown 命令改变所属
   #带端口号的拉取，默认22,可以不用写 直接 
   $ git clone 用户名@服务器IP:/XXX/仓库名.git 
   #或者添加remote
   $ git remote add origin ssh://用户名@服务器IP:端口号/XXX/仓库名.git
   ### 这种拉取和提交每次会要求输入用户密码，若嫌麻烦，可以加入密钥
   ```
   添加密钥公钥，参考[码云平台帮助文档V1.2 生成并部署SSH key](http://git.mydoc.io/?t=154712) ，[在阿里云上搭建自己的git服务器](https://www.cnblogs.com/herd/p/7063091.html)和[廖雪峰的官方网站·git教程·使用码云](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/00150154460073692d151e784de4d718c67ce836f72c7c4000)  

   ```bash
   $ ssh-keygen –t rsa #本机，生成密钥
   $ cd ~/.ssh
   $ vi id_rsa.pub    #复制内容

   $ cd /home/用户名/   #存有仓库名.git的那个文件夹
   $ mkdir .ssh        #裸仓库没有这个所以要自己建
   $ cd .ssh
   $ vi authorized_keys   #粘贴刚才的内容，保存即可
   ```

   不过这个方法我在裸仓库上没有成功。不过不影响同步目录到网页。设置钩子即可

   ```bash
   $ cd /home/用户名/仓库名.git/hooks
   $ cat > post-receive <<EOF  #输入一下内容

   >#!/bin/bash
   >git --work-tree=/var/www/hamlet checkout -f  #目录是你的网页主目录
   >EOF
   $ chmod +x post-receive
   ```

   到此，已全部部署完毕。上传index.html即可看到自己的网站了。

   ​