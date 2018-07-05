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

```sh
#!/usr/bin/env groovy

node {
    def app

    environment {
        ownRegistry = 'hub.simo.ir'
        ownRegistrySchema = 'http'

    }

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("${ownRegistry}/alpine-test")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    if(env.BRANCH_NAME == 'master'){
        stage('Push image') {
            /* Finally, we'll push the image with two tags:
            * First, the incremental build number from Jenkins
            * Second, the 'latest' tag.
            * Pushing multiple tags is cheap, as all the layers are reused. */
            docker.withRegistry("${ownRegistrySchema}://${ownRegistry}") {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
        }
    }
}

```
