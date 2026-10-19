pipeline{

	agent any
	environment{
		DOCKER_IMAGE="grater-java:latest"
	}
	
	stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sudhamshcdac/java_jenkins.git'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    if (fileExists('Dockerfile')) {
                        sh "docker build -t ${env.DOCKER_IMAGE} ."
                    } else {
                        error "Dockerfile not found in the workspace. Please create one for your Python application."
                    }
                }
            }
        }

        stage('Docker Run (Optional)') {
            steps {
                sh "docker run --rm ${env.DOCKER_IMAGE}"
            }
        }
    }

    post {
        success {
            echo 'java application Docker image built successfully.'
        }
        failure {
            echo 'Docker build or run failed.'
        }
    }
}

