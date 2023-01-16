pipeline {
    agent any
    environment {
        dockerImage = ''
    }
    stages {
        stage('Build and Install') {
            steps {
                script{
                sh 'npm install'
               }
            }
        }
        stage('Sonar'){
               steps{
                   sh 'echo "Hello"'
//                 sh ''' 
//                  sonar-scanner \
//    -Dsonar.projectKey=NodeJs-app \
//    -Dsonar.sources=. \
//    -Dsonar.host.url=http://194.195.113.53:9000 \
//    -Dsonar.login=sqp_63016564e6637699899e22ad5c33afd4e1b3602c
//   '''
            }
       }
        stage('Dcoker Build') {
            steps {
                sh 'docker build -t shubhamghavas/nodejs:latest .'
            }
        }
        stage("push to registery"){
            steps{
                sh "docker login -u shubhamghavas -p Shubham@2000"
                sh "docker push shubhamghavas/nodejs:latest"
            }
        }
        stage('Ansible install docker'){
            steps{
                 ansiblePlaybook credentialsId: 'git-key', disableHostKeyChecking: true, inventory: 'ansible/dev.inv', playbook: 'ansible/install-docker.yml'
            }
        }
        stage('Start the docker container'){
            steps{
                 ansiblePlaybook credentialsId: 'git-key', disableHostKeyChecking: true, inventory: 'ansible/dev.inv', playbook: 'ansible/deploy-image.yml'
            }
        }
    }
}
