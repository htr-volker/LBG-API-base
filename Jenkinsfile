pipeline {
    agent any
    environment {
	image_name="htrvolker/lbg-api-app:latest"
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
		docker build -t $image_name .
		echo
		"""
            }
        }
	stage('Push') {
            steps {
                sh """
                echo "Push image to registry:"
                docker push $image_name
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

