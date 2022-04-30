pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh 'echo "Hello World"'
            }
        }
        stage('Code') {
            steps {
                git 'https://github.com/jvinc86/web-austronauta-apache.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker stop website'
                sh 'docker rm website'
                sh 'docker rmi vincenup/nasaimagen:"latest"'
                sh 'docker build -t vincenup/nasaimagen:${BUILD_NUMBER} .'
                sh 'docker tag vincenup/nasaimagen:${BUILD_NUMBER} vincenup/nasaimagen:"latest"'
            }
        }
        stage('Release') {
            steps {
                sh 'docker login -u "vincenup" -p "85c91b79-68d8-496a-89d2-470d97fff5a6" docker.io'
                sh 'docker push vincenup/nasaimagen:${BUILD_NUMBER}'
                sh 'docker push vincenup/nasaimagen:"latest"'
                sh 'docker rmi vincenup/nasaimagen:${BUILD_NUMBER}'
                sh 'docker rmi vincenup/nasaimagen:"latest"'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d --name website -p 80:80 vincenup/nasaimagen:"latest"'
            }
        }


    }
}
