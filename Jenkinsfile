pipeline {
    agent any
    environment {
        APP_NAME="lbg-api-app"
	TAG="latest"
	DOCKERHUB_USERNAME=credentials("DOCKERHUB_CREDS_USR")
	DOCKERHUB_PASSWORD=credentials("DOCKERHUB_CREDS_PSW")
    }
    stages {
	stage('Test') {
            steps {
		sh "npm install"
                sh "npm test"
            }
        }
        stage('Build') {
            steps {
		sh """
		echo "Building image:"
		docker build -t ${DOCKERHUB_USERNAME}/${APP_NAME}:${TAG} .
		echo
		"""
            }
        }
	stage('Push') {
            steps {
		sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                sh """
                echo "Push image to registry:"
                docker push ${DOCKERHUB_USERNAME}/${APP_NAME}:${TAG}
                echo
                """
            }
        }
        stage('Deploy') {
            steps {
                //
		sh "echo Deploy stage"
            }
        }
    }
}

