#linux_op

linux 自定义命令打开网页

>*引言介绍* 之前当我还在用 Windows 的时候，偶然看到一篇黑马公社讲的[这才是极客玩电脑的方式，个性化命令实现快速打开QQ｜黑马三分钟](https://mp.weixin.qq.com/s/CbtPamDYkHI030ihaE4oFg)，后来发现不仅可以打开应用程序的，把网页地址存成一个`.bat` 文件也可以用来打开固定常用的网页。现在我换了linux之后，打开软件倒是好打开了，直接输入应用名就好，开网页就麻烦了。恩，对linux用户来说没有什么不可以。
##做法
- 新建一个shell
- 复制下方代码并改作你自己喜欢的网址和其他命令。
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

![Alt text](./op_1.png)

![Alt text](./op_2.png)

一口气打开也是相当顺溜的。

##改进
- 每次使用都要输入 `./op` 是不是觉得很麻烦，是的我也觉得。所以，改一下
`$vi ~/.bashrc`
- 在最后一行加入

`alias op='/home/你的文件夹名/op'` 
- let' have a try
![Alt text](./op_3.png)

##FAQ
- 怎么打开终端？
> ubuntu上的快捷键是`ctrl+alt+T`,所以当你熟练了之后，打开四五个网页只需要按 `5个键+4个自定义名称` ，总耗时，嗯，，网络通畅的话只需2秒。
- 为什么我输入了四个快捷命令只打开一个标签页。
> 这个和浏览器的启动有关系，如果没有提前将浏览器打开得话会出现一堆报错，第一个网页虽然可以浏览，但是第二个网页需要第一个网页关闭后才会跳出来（至少火狐上是这样，chrome没用过不知道）;如果提前打开了浏览器，即使只是一个空白页也可以，打开四五个毫无压力。我自己浏览器倒是常开，不影响使用，如果介意可以在脚本的`for`语句前加入`firefox `打开一个空白页。







