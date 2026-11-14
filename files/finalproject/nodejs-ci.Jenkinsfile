pipeline {
    agent any
    tools {
        nodejs 'node16'
    }
    environment {
        NVD_API_KEY = credentials('nvd-api-key')
    }
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/vinicius-bagodi/Nodejs_MongoDB.git', branch: 'main'
            }
        }
        stage("Build") {
            steps {
                sh 'npm install'
            }
        }
        stage("Security Scan") {
            parallel {
                stage("Dependancy Check"){
                    steps {
                        dependencyCheck additionalArguments: """
                            -o './'
                            -s './'
                            -f 'ALL'
                            --prettyPrint
                            --nvdApiKey ${NVD_API_KEY}""", odcInstallation: 'OWASP Dependency-Check Vulnerabilities'
                        dependencyCheckPublisher pattern: 'dependency-check-report.xml',
                            failedTotalCritical: 1,
                            failedTotalHigh: 1,
                            stopBuild: true
                    }                    
                }
                stage("Secret Scan"){
                    steps {
                        
                    }
                }
            }
        }
    }
}