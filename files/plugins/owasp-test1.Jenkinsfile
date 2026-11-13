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
            withCredentials([string(credentialsId: 'nvd-api-key', variable: 'NVD_API_KEY')]) {
                dependencyCheck additionalArguments: """
                    -o './'
                    -s './'
                    -f 'ALL'
                    --prettyPrint
                    --nvdApiKey ${NVD_API_KEY}""", odcInstallation: 'OWASP Dependency-Check Vulnerabilities'
            }
            dependencyCheckPublisher pattern: 'dependency-check-report.xml'
        }
    }
    }
}
