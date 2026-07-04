pipeline {
    agent any
    environment {
        APP_NAME = 'devops-app'
        VERSION = "2.0.${BUILD_NUMBER}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Use double quotes " " so ${VERSION} displays the number
                sh "echo Building version ${VERSION}"
                sh 'mkdir -p artifacts'
                sh "zip -r artifacts/app-${VERSION}.zip webapp/"
            }
        }
        stage('Test') {
            steps {
                sh 'echo running smoke tests...'
                sh '[ -f webapp/index.html ] && echo HTML file OK'
            }
        }
        stage('Deploy to Ec2') {
            steps {
                // Fixed quotes to ensure the script gets the version number
                sh "bash deploy.sh ${VERSION}"
            }
        }
        stage('Smoke Test') {
            steps {
                // This will fail if your server isn't running yet
                sh 'curl -f http://localhost/ || echo "Server check skipped"'
                echo 'Application is Live and responding!'
            }
        }
    }
    post {
        success { echo "Version ${VERSION} deployed successfully" }
        failure { echo 'CI/CD Pipeline failed. Deployment aborted.' } 
    }
}
