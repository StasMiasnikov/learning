node("back_office"){
stage("Checkout"){
checkout scm

dir("App/server"){
def registry_host="ec2-13-58-129-253.us-east-2.compute.amazonaws.com"
    sh "docker build -t $registry_host:5000/app:latest ."
    sh "docker push $registry_host:5000/app:latest "
}
}


}