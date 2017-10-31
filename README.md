#linux自定义快捷方式打开网页

>*引言介绍* 之前当我还在用 Windows 的时候，偶然看到一篇黑马公社讲的[这才是极客玩电脑的方式，个性化命令实现快速打开QQ｜黑马三分钟](https://mp.weixin.qq.com/s/CbtPamDYkHI030ihaE4oFg)，后来发现不仅可以打开应用程序的，把网页地址存成一个`.bat` 文件也可以用来打开固定常用的网页。现在我换了linux之后，打开软件倒是好打开了，直接输入应用名就好，开网页就麻烦了。恩，对linux用户来说没有什么不可以。
##做法
- 新建一个shell
- 复制下方代码并该做你自己喜欢的网址和其他命令。
```bash
#!/bin/bash
for wangye
do 
    case $wangye in
        mk) 
        #这个是你自定义一个快捷命令
            firefox https://maxiang.io/    
            # 网址，这里用火狐打开的
            ;;
        my)
            firefox http://my.bugatii100peagle.cn
            ;;
        cn)
            firefox http://www.runoob.com/
            ;;
        github)
            firefox https://github.com/
            ;;
        sk)
            firefox http://www.ucdrs.superlib.net/
            ;;
        gsh)
            firefox http://222.195.136.24/
            ;;
        al)
            firefox https://account.aliyun.com/login/login.htm?oauth_callback=https%3A%2F%2Fhome.console.aliyun.com%2F%3Fspm%3D5176.100238.765261.3.Q0IESk
            ;;
      dd)
            firefox https://im.dingtalk.com/
     
    esac
done
```

-保存文件并修改文件权限。
 > `$chmod 777 文件名`
 

##使用
在终端输入 `./op mk` 这里 `op` 是我编写的这个shell的名字， `mk` 我定义的是打开的马克飞象的连接。因为我有在不同电脑使用软件的需要，所以一些软件还是网页版比较方便。
如果想一口气打开多个网页或者应用，也是可以的。

![Alt text](https://github.com/Bugatti100Peagle/linux-/blob/master/Screenshot-2017-10-31%202017-10-31%2013-23-16%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%20png%EF%BC%88PNG%20%E5%9B%BE%E5%83%8F%EF%BC%8C732x438%20%E5%83%8F%E7%B4%A0%EF%BC%89.png)
![Alt text](https://github.com/Bugatti100Peagle/linux-/blob/master/Screenshot-2017-10-31%202017-10-31%2013-13-02%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%20png%EF%BC%88PNG%20%E5%9B%BE%E5%83%8F%EF%BC%8C1920x1080%20%E5%83%8F%E7%B4%A0%EF%BC%89.png)

一口气打开也是相当顺溜的。

##改进
- 每次使用都要输入 `./op` 是不是觉得很麻烦，是的我也觉得。所以，改一下
`$vi ~/.bashrc`
- 在最后一行加入

`alias op='/home/你的文件夹名/op'` 
- let' have a try

-  ![Alt text](https://github.com/Bugatti100Peagle/linux-/blob/master/2017-10-31%2014-10-02%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2.png)







 
