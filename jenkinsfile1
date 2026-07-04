pipeline {
agent any
environment {
APP_NAME = 'devops-app'
VERSION = "2.0.${BUILD_NUMBER}"
}
stages {
stage('Checkout') {steps {Checkout SCM}}
stage('Build') {
steps {
sh 'echo Building version ${VERSION}'
sh 'mkdir -p artifacts'
sh 'zip -r artifacts/app-${VERSION}.zip webapp/'
}
}
stge ('Test') {
steps {
sh 'echo running smoke tests...'
sh '[ -f webapp/index.html ] && echo HTML file OK'
sh 'grep -q Devops webapp/index.html && echo Content OK'
}
}
stage ('Deploy to Ec2') {
steps {
sh 'bash deploy.sh ${VERSION}'
}
}
stage ('Smoke Test') {
steps {
sh 'curl -f http://localhost/ | grep Devops'
echo 'Application is Live and responding!'
}
}
}
post {
success { echo "Version ${VERSION} deployed successfully" }
failure { echo 'CI/CD Pipeline failed. Deployment aborted.' } 
}
}
