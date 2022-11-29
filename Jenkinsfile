pipeline {
    agent {label 'sla'} 
    stages {
        stage('my Build') { 
            steps {
                sh 'ls'
                sh 'mvn package'
                sh 'scp -R /home/slave/workspace/servertoserver/target/hello-world-war-1.0.0.war ubuntu@172-31-9-179:/opt/tomcat/webapps'
            }
        }    
        stage( 'my deploy' ) {
        agent {label 'service'} 
            steps {
               sh 'sh /opt/tomcat/bin/shutdown.sh'
               sh 'sh /opt/tomcat/bin/startup.sh' 
            }
        }    
    }
}
