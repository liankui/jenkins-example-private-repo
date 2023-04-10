pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh id
                sh 'node --version'
                sh 'svn --version'
            }
        }
    }
}
