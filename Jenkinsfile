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

    post {
        success {
            mail to: 'hhhalsaigh@gmail.com',
                 subject: "SUCCESS: Build and Deployment Succeeded",
                 body: "Good news! The Jenkins pipeline executed successfully, and your project was deployed."
            echo 'Build and deployment succeeded!'
        }
        failure {
            mail to: 'hhhalsaigh@gmail.com',
                 subject: "FAILURE: Build or Deployment Failed",
                 body: "Unfortunately, the Jenkins pipeline failed. Please check the console output for more details."
            echo 'Build or deployment failed.'
        }
    }
}
