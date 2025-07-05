pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/o0morgan0o/art-explorer.git'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t art-explorer .'
            }
        }

        stage('Deploy to Prod') {
            steps {
                sshagent (credentials: ['cle-jenkins']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no -i ~/.ssh/jenkins_key louis@192.168.1.154 "
                        docker stop art-explorer || true &&
                        docker rm art-explorer || true &&
                        docker build -t art-explorer /home/louis/art-explorer &&
                        docker run -d -p 5000:5000 --name art-explorer art-explorer
                    "
                    '''
                }
            }
        }
    }

    post {
        failure {
            echo "Le build a échoué !"
        }
    }
}
