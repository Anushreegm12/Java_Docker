pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "anushreegm12/java-helloworld:v1"
    }
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/anushreegm12/Java_Docker.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
