node('back_office') {
    stage('Checkout') {
        checkout scm
    }

        dir('App/server') {
            registryHost = 'staslearning.ddns.net'
            stage('Build image') {
            sh "docker build -t $registryHost:5000/app:latest ."
            }
            stage('Deploy image') {
            sh "docker push $registryHost:5000/app:latest "
        }
        }
}
