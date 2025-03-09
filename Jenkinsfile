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
                sh 'terraform -chdir=C:/Users/lenovo/Downloads/finalcicd/spring-petclinic/terraform init'
                sh 'terraform -chdir=C:/Users/lenovo/Downloads/finalcicd/spring-petclinic/terraform validate'
                sh 'terraform -chdir=C:/Users/lenovo/Downloads/finalcicd/spring-petclinic/terraform apply --auto-approve'
            }
        }
        stage('DP with k8s') {
            steps {
                sh 'kubectl apply -f k8s/cicd-dp.yml'
            }
        }
    }
}
