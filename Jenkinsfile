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
			script {
				docker.withRegistry("https://807410046616.dkr.ecr.us-east-1.amazonaws.com/dotnet-core-hello-world-webapp", "ecr:us-east-1:kworx-training-ecr-deployer") {
					docker.image("dotnet-core-hello-world-webapp:${env.BUILD_NUMBER}").push()
				}
			}
		}
	}

	stage('Deploy to EKS') {
		steps {
			sh "kubectl set image deployments/dotnetcore-helloworld dotnet-core-hello-world-webapp=807410046616.dkr.ecr.us-east-1.amazonaws.com/dotnet-core-hello-world-webapp:${env.BUILD_NUMBER} --all"
		}
	}
    }
}

