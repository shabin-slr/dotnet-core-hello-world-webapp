pipeline {
    agent any
    stages {
        stage('Snyk Scan') {
            steps {
		//snykSecurity monitorProjectOnBuild: false, projectName: 'dotnet-core-hello-world-webapp', snykInstallation: 'snyk@latest', snykTokenId: 'Synk Token', targetFile: 'app/dotnet-core-hello-world-web-app.csproj'
		sh "snyk test --file=app/dotnet-core-hello-world-web-app.csproj"
            }
        }
        stage('Build') {
	    steps { 
		sh "docker build -t dotnet-core-hello-world-webapp:${env.BUILD_NUMBER} ."
            }
	}
    }
}

