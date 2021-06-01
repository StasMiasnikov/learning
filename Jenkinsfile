node('back_office') {
    stage('Checkout') {
        checkout scm
    }

        dir('App/server') {
            registryHost = 'staslearning.ddns.net'
            imageTag = "$registryHost:5000/app:latest"
            stage('Build image') {
            sh "docker build -t $imageTag ."
            }
            stage('Bake test results') {
                sh "docker run --rm --entrypoint /bin/sh $imageTag -c 'cat /*.xml' > testResult.xml"
                junit keepLongStdio: true, testResults: 'testResult.xml'
            }
            stage('Deploy image') {
            sh "docker push $imageTag "
        }
        }
}
