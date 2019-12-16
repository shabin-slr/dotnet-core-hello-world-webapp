pipeline {
    stages {
        stage('Snyk Scan') {
            steps {
		snykSecurity monitorProjectOnBuild: false, projectName: 'dotnet-core-hello-world-webapp', snykInstallation: 'snyk@latest', snykTokenId: 'Synk Token'
            }
        }
        stage('Build') {
	    steps { 
		sh 'docker build -t dotnet-core-hello-world-webapp:${env.BUILD_NUMBER}'
            }
	}
    }
}

