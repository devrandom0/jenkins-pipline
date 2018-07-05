# jenkins-pipline

click on `New Item`.

![alt text](https://raw.githubusercontent.com/sinamoghaddas/jenkins-pipline/master/docs/1-new-item.png)



write name of item in `Enter an item name`, Select `Pipeline` and click on OK

![alt text](https://raw.githubusercontent.com/sinamoghaddas/jenkins-pipline/master/docs/2-select-type.png)



at `Build Triggers`, check `Poll SCM`, and write schedule for it.
in my example it check every 5 minutes.

![alt text](https://raw.githubusercontent.com/sinamoghaddas/jenkins-pipline/master/docs/3-config-build-triggers-schedule.png)



at `Pipeline` tab, use `Pipeline script from SCM` with `SCM` git in `Definition`.
write down `Repository URL`, check your `Script Path` (Jenkinsfile) and `Branch Specifier`
Click on Save

![alt text](https://raw.githubusercontent.com/sinamoghaddas/jenkins-pipline/master/docs/4-config-pipeline-with-git.png)



you can use `Build Now`

![alt text](https://raw.githubusercontent.com/sinamoghaddas/jenkins-pipline/master/docs/5-build-now-1.png)



# Jenkinsfile

Check it:  
https://github.com/sinamoghaddas/jenkins-pipline/blob/master/Jenkinsfile
