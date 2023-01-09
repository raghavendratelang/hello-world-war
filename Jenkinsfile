pipeline {
    agent {label 'sla'}
    stages {
        stage('my Build') {
            steps {
                sh "echo ${BUILD_VERSION}"
                sh 'docker build -t tomcat_build .'
            }
        }  
        stage('publish stage') {
            steps {
                sh "echo ${BUILD_VERSION}"
                sh 'docker login -u prajwal1327 -p Prajwal@1'
                sh 'docker tag tomcat_build:latest prajwal1327/mytomcat:latest'
                sh 'docker push prajwal1327/mytomcat:latest'
            }
        } 
        stage( 'my deploy' ) {
        agent {label 'service'} 
            steps {
               sh 'docker pull prajwal1327/mytomcat:latest'
               sh 'docker rm -f mytomcat'
               sh 'docker run -d -p 8080:8080 --name mytomcat prajwal1327/mytomcat:latest'
            }
        }    
    } 
}
