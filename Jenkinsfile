pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/core/sdk:3.0.101-alpine3.10' 
        }
    }
    stages {
        stage('Snyk Scan') {
            steps {
		snykSecurity monitorProjectOnBuild: false, projectName: 'dotnet-core-hello-world-webapp', snykInstallation: 'snyk@latest', snykTokenId: 'Synk Token'
            }
        }
        stage('Build') { 
		sh 'docker build -t dotnet-core-hello-world-webapp:${env.BUILD_NUMBER}'
            }
        }
    }
}

