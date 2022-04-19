import sys
user1=sys.argv[1]
pass1=sys.argv[2]
urll=sys.argv[3]
apppath=sys.argv[4]
targets=sys.argv[5]
appname1=sys.argv[6]
connect(user1,pass1,'t3://' + urll)
print 'Deploying application' + appname1
deploy(appname1,apppath + ".war",targets)
print 'Done Deploying application ' + appname1
disconnect()
exit()

