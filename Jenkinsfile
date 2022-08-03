pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out...'
                git url: 'https://github.com/ruialvespinto/nodejs_angular_demo.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                dir('my-app'){
                    bat 'npm install @angular/cli'
                    bat 'npm run build'
                }
            }
        }
        stage ('Docker Image') {
          steps {
            script {
                docker.withRegistry('https://registry.hub.docker.com', 'ruialvespinto-dockerhub-credentials') {
                    def customImage = docker.build("ruialvespinto/myapp_image:${env.BUILD_ID}")
                    customImage.push()
                }
            }
          }
        }
       
    }
}