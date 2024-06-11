pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES') 
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    
    environment {
        def appVersion = ''

    }
    stages {
        stage('read the version') {
            steps {
                script {
                    def packagejson = readJSON file: 'package.json'
                    appVersion = packagejson.version
                    echo "applicatio version : $appVersion"

                }
                
            }
        }
        stage('install depenecies') {
            steps {
                sh """
                npm install
                ls -ltr
                echo "applicatio version : $appVersion"
                """
    
            }
        }
        stage('build') {
            steps {
                sh """
                zip -r backend-${appVersion}.zip */ -x Jenkinsfile -x backend-${appVersion}.zip
                ls -ltr
                """
                
            }
        }
        
        
        
    }

    post { 
        always { 
            echo 'I will always say Hello again!'
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}