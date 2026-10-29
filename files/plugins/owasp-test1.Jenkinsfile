pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/owasp/test1.git', branch: 'main'
            }
        }
        stage('OWASP Test') {
            steps {
                dependencyCheck additionalArguments: ''' 
                    -o './'
                    -s './'
                    -f 'ALL' 
                    --prettyPrint''', odcInstallation: 'OWASP Dependency-Check Vulnerabilities'
            
                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
        }
    }
}
