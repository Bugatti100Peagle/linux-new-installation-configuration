# 加了发音的无道词典
> Author: Bugatti100Peagle  Mail: 3443988515@qq.com
> Created Time: 2018年02月26日 星期一 20时29分34秒

之前我在作者主页上看到了这款词典工具，非常喜欢。不过，可惜不能发音。我还希望他可以像一些词典那样提醒我复习单词呢。索性自己做一个。
### 原料：
[Wudao-dict](https://github.com/ChestnutHeng/Wudao-dict)
[espeak](http://www.eguidedog.net/doc/doc_espeak.php#install_espeak)
[mutt](http://blog.csdn.net/nolan__roronoa/article/details/52335223)

### 烹饪方法

1. 下载[Wudao-dict](https://github.com/ChestnutHeng/Wudao-dict) ，按照原文方法安装即可。

2.  安装 espeak 。下载时由于网络原因经常会断线，卡顿，在等待它下载完成的这段时间里，我们可以先下载好其他的东西。

   ```bash
   # 下载espeak
   $ sudo apt-get install espeak

   # 测试espeak
   $ espeak hello world
   ```

   如果你麦克风正常的话，可以听到一声富有磁性的带升降调的男性声音的"hello world",虽然有点魔性(以后尝试一下能不能换个声源)

3. 安装配置[mutt](http://blog.csdn.net/nolan__roronoa/article/details/52335223)，按照原文方法安装配置即可。

4. ​

   ### 