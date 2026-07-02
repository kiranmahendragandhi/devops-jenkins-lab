pipeline {
agent any
environment {
APP_NAME = 'devops-app'
VERSION = "1.0.${BUILD_NUMBER}"
}
stages {
stage('Checkout') {
steps {
echo 'Pulling source code...'
checkout scm
}
}
stage('Build') {
steps {
echo "Building ${APP_NAME} version ${VERSION}"
sh 'mkdir -p build && echo built > build/artifact.txt'
}
}
stage('Test') {
steps {
echo 'Running test...'
sh 'echo TEST PASSED >> build/artifact.txt'
}
}
stage('Deploy') {
steps {
echo "Deploying version ${VERSION} to server"
sh 'cp build/artifact.txt /tmp/deployed_app.txt'
sh 'cat /tmp/deployed_app.txt'
}
}
}
post {
success { echo 'Pipeline completed successfully!' }
failure { echo 'Pipeline FAILED. Check logs abive.' }
}
}
