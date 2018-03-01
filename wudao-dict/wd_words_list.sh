#*************************************************************************
#	> File Name: wd_words_list.sh
#	> Author: Bugatti100Peagle 
#	> Mail: 3443988515@qq.com
#	> Created Time: 2018年02月13日 星期二 17时18分22秒
#   > 发送单词表到邮箱 
#************************************************************************/
#!/bin/bash
filename="notebook.txt"
case $1 in
    -a)
        sed '/^\s*$/d' $filename|sort -u | awk '$1 ~/["`date '+%Y'`"]/ ' | mutt  -s "All_new words" 你的邮箱@qq.com
        #去掉空格，重复行，时间戳，只保留单词和释义，并以 All_new words 为主题发送邮件至指定的邮箱 
        ;;
    *)
        echo "`date '+%x'`" >> $filename
        day_now=$(cat -n $filename |grep "`date '+%Y'`" |tac |sed -n '1p' | awk '{print $1}')
        day_last=$(cat -n $filename |grep "`date '+%Y'`" |tac |sed -n '2p' | awk '{print $1}') 
        #获取时间戳行号
        sed -n "${day_last},${day_now}p" $filename |sort -u | awk '$1 ~/["`date '+%Y'`"]/ ' | mutt  -s " `sed -n "${day_last}p" $filename`_to_`sed -n "${day_now}p" $filename`_words" 你的邮箱@qq.com
        #截取最近两次时间戳内的单词，去掉重复行，时间戳，以两次时间为主题发送邮件
        ;;
esac


