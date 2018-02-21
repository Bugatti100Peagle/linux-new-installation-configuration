# git_service
> Author: Bugatti100Peagle  Mail: 3443988515@qq.com
> Created Time: 2018年02月21日 星期三 10时35分12秒

# git 搭建服务器，同步目录到网页

1. 安装git: 

```
yum -y install git
```

1. 配置git，参考[廖雪峰的git教程·安装git](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/00137396287703354d8c6c01c904c7d9ff056ae23da865a000) 

2. 创建仓库，提交代码，略

3. 在服务器上搭建git，创建自己的`github` 服务，参考[Git推送到服务器自动同步到站点目录](https://www.linuxidc.com/Linux/2017-05/143313.htm) 和 [云中沙箱 - 基于阿里云的IT实验平台](https://edu.aliyun.com/lab/courses/129136057c2a4d50af22490b5ce8f878/detail?purchaseRecordId=5718e0756dca40eb88c53d3c09a02233) 

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
