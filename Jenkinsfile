pipeline {
    agent { label 'SPC-BUILD-1'}
    stages {
        stage('git url') {
          steps {
            git url: 'https://github.com/gitaditya1999/spring-petclinic.git',
                branch: 'main'
          }
        }
        stage('build') {
            steps {
                sh 'mvn_AD_9 package'
            }
        }
    }   
}