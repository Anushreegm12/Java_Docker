pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "anushreegm12/java-helloworld:v1"
        KUBE_CONFIG=credentials('k8s-token')
    }
    stages {
        stage('Checkout Code') {
            steps {
                git url:'https://github.com/Anushreegm12/Java_Docker.git', branch: 'main'
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
                script{
                    kubernetesDeploy (configs: 'deployment.yaml', kubeconfigId: 'k8s-cred')
                    kubernetesDeploy (configs: 'service.yaml', kubeconfigId: 'k8s-cred')
            }
        }
    }
}
