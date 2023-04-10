pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                echo 'hello'
                sh 'node --version'
                sh 'svn --version'
            }
        }
    }
}
