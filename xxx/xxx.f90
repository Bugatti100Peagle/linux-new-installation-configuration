!****************************************************************************
!	> File Name: xxx.f90
!	> Author: Bugatti100Peagle 
!	> Mail: 3443988515@qq.com
!	> Created Time: 2018年02月22日 星期四 22时14分28秒
!****5****10********20********30********40********50********60********70*****
! 来自以下shell
!#*************************************************************************
!#	> File Name: xxx.sh
!#	> Author: Bugatti100Peagle 
!#	> Mail: 3443988515@qq.com
!#	> Created Time: 2018年02月22日 星期四 21时29分52秒
!#   > 隔词挖空，背个X啊
!#************************************************************************/
!
!# 第一个参数决定第一个词挖不挖 1,2 ，第二个参数是文件
!# 默认以两倍'__'替换原本的一个字母，方便手写默写和批注。默认跳过标点
!==> 使用方法，新建目录，在目录下放置好命令文件，howtoxxx.txt
      ! 第一行 指定 挖奇数，挖偶数,jos,目前只支持保留首单词的格式
      ! 第二行 指定 被挖文件名 目前只支持一个 filename 
      ! 第三行 指定 每个字母替换格式， 如 "__" 以半角双引号封装
      ! xxx_format
      program xxx 
          integer             ::i,j,k,jos
          character           ::separate_words_new,separate_words_old
          character(len=20)   ::filename,xxx_format
          character(len=50)   ::stay_words,clear_words      !保留或去除的单词
          character(len=300)  ::line
          !一行不要超过300字符

          open(10,File="howtoxxx.txt",status='old')
          read(10,*),jos
          read(10,*),filename
          read(10,*),xxx_format
          close(10)
          ! print*,jos,filename,xxx_format
          print*,'请确认单行字符不超300'
          
          open(11,File=filename,status='old')
          open(12,File="new_filename.txt")
          
          read(11,'(a300)'),line
          k=len_trim(line)
          
          separate_words_old='A'
          j=1
          do i=1,k
              separate_words_new=line(i:i)
              if(ichar(separate_words_new)<65)then
                  stay_words=line(j:i-1)
                  print*,i,j,stay_words
                  j=i
             end if

          end do


      end program
