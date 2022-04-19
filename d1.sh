#!/bin/bash
env1=`echo $env | tr ',' ' '`
for i in $env1
do
f1=/u01/app/oracle/feb/wl12c/jenkins/scripts/weblogic.properties
file=`grep "$i" $f1`
echo $file 
app=`echo $App_name |tr ',' ' '`
echo $app
DEPPATH="/u01/app/oracle/feb/wl12c/jenkins/scripts"
APPATH="/u01/app/oracle/feb/wl12c/jenkins/git_practice/test"
CLONEPATH="/u01/app/oracle/feb/wl12c/jenkins/git-practice"
cd  $CLONEPATH
git clone git@github.com:Unnammanasa/test.git
WLST_HOME="/u01/app/oracle/feb/wl12c/weblogic/oracle_common/common/bin"
env2=`echo $file |tr '| ' ' ' |awk '{print $1}'`
user=`echo $file |tr '| ' ' ' |awk '{print $2}'`
pass=`echo $file |tr '| ' ' ' |awk '{print $3}'`
url=`echo $file |tr '| ' ' ' |awk '{print $4}'`
echo $env2
echo $user
echo $pass
echo $url
echo $app
echo $Targets
if [ $env2 = "Dev" ]
then
for i in $app
do
$WLST_HOME/wlst.sh $DEPPATH/deploy.py $user $pass $url $APPATH/$i $Targets $i
done
elif [ $env = "Test" ]
then
for i in $app
do
$WLST_HOME/wlst.sh $DEPPATH/deploy.py $user $pass $url $APPATH/$i $Targets $i
done
fi
done

