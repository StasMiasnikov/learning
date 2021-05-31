node('back_office') {
    stage('Checkout') {
        checkout scm

        dir('App/server') {
            def registry_host = 'staslearning.ddns.net'
            sh "docker build -t $registry_host:5000/app:latest ."
            sh "docker push $registry_host:5000/app:latest "
        }
    }
}
