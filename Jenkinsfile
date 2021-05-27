node{
    def mavenhome = tool name: "maven3.8.1"
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])
    
  stage('chechout') {
      git branch: 'development', credentialsId: '0cc183e4-7324-4877-ae87-9a950df3047c', url: 'https://github.com/harichandana13/maven-web-application.git'
      
      }
   stage('build'){
       
     sh "${mavenhome}/bin/mvn clean package"
   } 
    stage('excute sonar qube'){
    sh "${mavenhome}/bin/mvn sonar:sonar"
}
stage('upload artifacts to nexcus'){
    
    
    sh "${mavenhome}/bin/mvn deploy"
}
stage('deploy the application into tomacte server'){
    
    sshagent(['6b4f81f3-302f-4691-9361-8c0b42a1c010']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@18.222.231.244:/opt/apache-tomcat-9.0.45/webapps"
}
}
stage('send notification'){
    
   emailext body: '', subject: 'realted to project build', to: 'harichandananv1@gmail.com' 
    
}

}
