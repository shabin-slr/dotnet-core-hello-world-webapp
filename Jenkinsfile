pipeline {
    agent any
    stages {
        // stage('Snyk Scan') {
        //    steps {
	//	snykSecurity monitorProjectOnBuild: false, projectName: 'dotnet-core-hello-world-webapp', snykInstallation: 'snyk@latest', snykTokenId: 'Synk Token', targetFile: './app/dotnet-core-hello-world-web-app.csproj'
        //   }
        // }
        stage('Build') {
	    steps { 
		sh "docker build -t dotnet-core-hello-world-webapp:${env.BUILD_NUMBER} ."
            }
	}

	stage('Push to ECR') {
		steps { 
			withDockerRegistry(credentialsId: 'ecr:us-east-1:kworx-training-ecr-deployer', url: '807410046616.dkr.ecr.us-east-1.amazonaws.com/dotnet-core-hello-world-webapp') {
				sh "aws ecr get-login --no-include-email --region us-east-1"
				sh "docker tag dotnet-core-hello-world-webapp:latest 807410046616.dkr.ecr.us-east-1.amazonaws.com/dotnet-core-hello-world-webapp:latest"
				sh "docker push 807410046616.dkr.ecr.us-east-1.amazonaws.com/dotnet-core-hello-world-webapp:latest"
			}
		}
	}
    }
}

