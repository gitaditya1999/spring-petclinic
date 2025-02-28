pipeline {
    agent {
        label "ADITYACD"
    }
    stages {
        stage('git checkout') {
            steps {
                git url: 'https://github.com/gitaditya99/spring-petclinic.git', 
                branch: 'main'
            }
        }
        stage('terraform iac') {
            steps {
                sh 'terraform init'
                sh 'terraform validate'
                sh 'terraform apply --auto-approve'
            }
        }
        stage('DP with k8s') {
            steps {
                sh 'kubectl apply -f k8s/cicd-dp.yml'
            }
        }
    }
}