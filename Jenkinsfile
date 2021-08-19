node {
    def app
    def web
	
    stage('Cloning repository from Git') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Building image') {
        /* This builds the actual image */
	steps {
                    echo 'Starting to build docker images'
                    script {
                        app = docker.build("maryamalmannsour/docker-images-backend:${env.BUILD_ID}","-f ${env.WORKSPACE}/backend/Dockerfile .")
                        web = docker.build("maryamalmannsour/docker-images-frontend:${env.BUILD_ID}","-f ${env.WORKSPACE}/frontend/Dockerfile .") 
		    }
                }
        /*app = docker.build("maryamalmannsour/docker-images-backend")
	app = docker.build("maryamalmannsour/docker-images-frontend")*/
    }

    stage('Pushing image to Docker-Hub') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-id') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Image Build to DockerHub"
    }
}
