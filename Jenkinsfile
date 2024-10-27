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
                    bat 'docker pull husain7/bookstore:latest'
                    bat 'docker stop bookstore || true'
                    bat 'docker rm bookstore || true'
                    bat 'docker run -d -p 8000:8088 --name bookstore husain7/bookstore:latest' 
                }
            }
        }
    }
}
