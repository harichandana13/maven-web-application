FROM tomcat:8-jdk-corretto
COPY target/maven-web-applicaton*.war /usr/local/tomcat/webapps/maven-web-application.war
