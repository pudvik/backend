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
        DEPLOY_TO = 'production'
        GREETING = 'Good morning'

    }
    stages {
        stage('read the version') {
            steps {
                script {
                    def packagejson = readJSON file: 'package.json'
                    def appVersion = packagejson.version
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