node {
    def app
    def web
	
    stage('Cloning repository from Git') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Building image backend') {
        /* This builds only one actual image, uncomment the one you want */
        dir ('./backend') {
             app = docker.build("maryamalmannsour/public-images-backend")
	}
}
//     stage('Building image frontend') {
//         dir ('./frontend') {
// 	     web = docker.build("maryamalmannsour/public-images-frontend")
// 	}
// }

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
