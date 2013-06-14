#!/bin/bash
dir=/fileserver/1/0
dir_bak=/bak/fileserver/1/0
cur_date=`date +%Y%m%d`
#90ago_date=`date --date="90 day ago" +%Y%m%d`
for (( i = 133 ; i > 123; i--))
do 
ago_date=`date --date="${i} day ago" +%Y%m%d`
if [ ! -d "$dir/$ago_date" ]
then
  dirA=("${dirA[@]}" "$dir/$ago_date")
  #cp -af $dir/$ago_date $dir_bak/ >> bak_`date +%Y%m%d`.log 2>&1
  #if [ $? -eq 0 ]
	#then
    #    echo "--------------------------`date +%Y%m%d%H:%M`----$dir/$ago_date copy success!!---------------------------" >> bak_`date +%Y%m%d`.log
	#else
	#    echo "--------------------------`date +%Y%m%d%H:%M`----$dir/$ago_date copy fail!!---------------------------" >> bak_`date +%Y%m%d`.log
	#	exit 1
  #fi
  
fi
done

for i in "${dirA[@]}"
do 
echo $i
rm -rf $i >> bak_`date +%Y%m%d`.log 2>&1

#if [ $? -eq 0 ]
	#then
    #    echo "--------------------------`date +%Y%m%d%H:%M`----$dir/$ago_date delete success!!---------------------------" >> bak_`date +%Y%m%d`.log
	#else
	#    echo "--------------------------`date +%Y%m%d%H:%M`----$dir/$ago_date delete fail!!---------------------------" >> bak_`date +%Y%m%d`.log
	#	exit 1
  #fi

done
