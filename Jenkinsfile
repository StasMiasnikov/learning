node("master"){
stage("Checkout"){
checkout scm

dir("src/main/App/server"){
    sh "docker build -t ec2-13-58-129-253.us-east-2.compute.amazonaws.com:5000/app:latest ."
    sh "docker push ec2-13-58-129-253.us-east-2.compute.amazonaws.com:5000/app:latest "
}
}


}