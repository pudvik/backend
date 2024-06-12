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
        nexusUrl = 'nexus.daws78s.online:8081'


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
                
                zip -q -r backend-${appVersion}.zip * -x Jenkinsfile -x backend-${appVersion}.zip
                ls -ltr
                """
                
            }
        }

        stage('Nexus Artifact Upload'){
            steps{
                script{
                    nexusArtifactUploader(
                        nexusVersion: 'nexus3',
                        protocol: 'http',
                        nexusUrl: "${nexusUrl}",
                        groupId: 'com.expense',
                        version: "${appVersion}",
                        repository: "backend",
                        credentialsId: 'nexus-auth',
                        artifacts: [
                            [artifactId: "backend" ,
                            classifier: '',
                            file: "backend-" + "${appVersion}" + '.zip',
                            type: 'zip']
                        ]
                    )
                }
            }
        }

        stage('Deploy'){
            steps{
                script{
                    def params = [
                        string(name: 'appVersion', value: "${appVersion}")
                    ]
                    build job: 'backend-deploy', parameters: params, wait: false
                }
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