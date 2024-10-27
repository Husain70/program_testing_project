pipeline {
    agent any

    
    tools {
        maven 'M3'
    }
    stages {
        stage('Source Code Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/program_testing_project']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/Husain70/program_testing_project']]
                )
            }
        }

        stage('Build and Test') {
            steps {
                bat "mvn clean test package"
            }
        }

        stage('Deploy to Server') {
            steps {
                script {
                    bat 'docker run -d -p 8088:8000 --name bookstore husain7/bookstore:latest'
                }
            }
        }
    }
}
