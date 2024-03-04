pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Building..."
                script {
                    sh 'chmod +x scripts/build.sh'
                    sh 'scripts/build.sh HelloWorld/'
                }
                archiveArtifacts artifacts: 'HelloWorld/build/*', fingerprint: true
            }
        }

        stage('Test') {
            steps {
                echo "Running..."
                script {
                    sh 'chmod +x scripts/run.sh'
                    sh 'scripts/run.sh'
                }
            }
        }
    }
}
