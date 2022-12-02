pipeline {
    agent {label 'sla'} 
    stages {
        stage('my Build') { 
            steps {
                sh "echo ${BUILD_NUMBER}"
                sh 'mvn deploy'
            }
        }    
        stage( 'my deploy' ) {
        agent {label 'service'} 
            steps {
               sh 'curl -u prajwalmore336@gmail.com:Admin@123 -O https://prajwal1327.jfrog.io/artifactory/libs-release-local/com/efsavage/hello-world-war/1.0.0/hello-world-war-1.0.0.war'
               sh 'cp -R hello-world-war-$(BUILD_NUMBER).war /opt/tomcat/webapps/' 
               sh 'sudo sh /opt/tomcat/bin/shutdown.sh'
               sh 'sleep 2'
               sh 'sudo sh /opt/tomcat/bin/startup.sh' 
            }
        }    
    } 
}
