#*************************************************************************
#	> File Name: wd_words_list.sh
#	> Author: Bugatti100Peagle 
#	> Mail: 3443988515@qq.com
#	> Created Time: 2018年02月13日 星期二 17时18分22秒
#   > 发送单词表到邮箱 #************************************************************************/
#!/bin/bash
filename="/home/kate/new_apps/Wudao-dict/wudao-dict/usr/notebook.txt"
case $1 in
    -a)
        sed '/^\s*$/d' $filename.txt | s-nail  -s "new words" 1342720800@qq.com
        #去掉空格，并以 new words 为主题发送邮件至指定你的邮箱 
        ;;
    *)
        echo "`date '+%x'`" >> $filename
        cat -n $filename |grep "`date '+%Y'`" |tac |sed -n '1,2p' 
        ;;
esac


