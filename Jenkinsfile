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
                    withEnv(["KUBECONFIG=${WORKSPACE}/.kubeconfig"]) {
                        writeFile file: "${WORKSPACE}/.kubeconfig", text: KUBE_CONFIG
                        sh 'chmod 600 ${workspace}/.kubeconfig'
                        sh """
                           kubectl apply -f deployment.yaml 
                           kubectl apply -f service.yaml
                        """
                    }
                }
            }
        }
    }
}
