pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/vinicius-bagodi/Nodejs_MongoDB.git', branch: 'main'
            }
        }
        stage('OWASP Test') {
            steps {
                dependencyCheck additionalArguments: ''' 
                    -o './'
                    -s './'
                    -f 'ALL' 
                    --prettyPrint''', odcInstallation: 'dependency-check'
            
                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
            }
        }
    }
}
