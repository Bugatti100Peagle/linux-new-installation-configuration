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
      ! 第一行 指定 挖奇数，挖偶数,jos
      ! 第二行 指定 被挖文件名 目前只支持一个 filename 
      ! 第三行 指定 每个字母替换格式， 如 "__" 以半角双引号封装
      ! xxx_format
      program xxx 
          integer             ::i,j,k,jos,line_end,n,str_weith
          character           ::separate_words_new
          character(len=20)   ::filename
          character(len=2)    ::xxx_format
          character(len=50)   ::stay_words,clear_words   !保留或去除的单词
          character(len=500)  ::line
          !一行不要超过300字符

          open(10,File="howtoxxx.txt",status='old')
          read(10,*),jos
          read(10,*),filename
          read(10,*),xxx_format
          close(10)
          ! print*,jos,filename,xxx_format
          
          print*,'请确认单行字符不超500，建议手动断句'
          
          open(11,File=filename,status='old')
          open(12,File="new_filename.txt")
          do 
          read(11,'(a500)',iostat=line_end),line
          if(line_end<0)exit
          k=len_trim(line)+1      ! 保证能截取到末尾字符
          j=1
          do i=1,k
              separate_words_new=line(i:i)
              if(ichar(separate_words_new)<65)then
                  stay_words=line(j:i-1)
                  jos=jos+1       ! 用于计数当前单词奇偶性
                  ! print*,i,j,stay_words,clear_words ! 测试使用
                  j=i
                  ! clear_words=stay_words  ! 兑换保留单词
              if(mod(jos,2)/=0)then
                  str_weith=len_trim(stay_words)
                  
                  do n=1,str_weith
                  write(12,'(a1,$)'),stay_words(n:n)
                  end do
                  write(12,'(a1,$)'),' '    ! 单词间隔

              elseif(stay_words==','.or. &
                    &stay_words=='.'.or. &
                    &stay_words=='!'.or. &
                    &stay_words=='?')then
                  write(12,'(a1,$)'),stay_words
              else
                  clear_words=repeat(xxx_format,len_trim(stay_words))
                  str_weith=len_trim(clear_words)
                  
                  do n=1,str_weith
                  write(12,'(a1,$)'),clear_words(n:n)
                  end do
                  write(12,'(a1,$)'),' '    ! 单词间隔
                 
              end if
             end if
          end do
          write(12,*) ! 一行一句

          end do
          print*,'完毕，请使用'
          print*,'vi new_filename.txt'
          print*,'查看文件'
      end program
