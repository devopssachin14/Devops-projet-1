pipeline {
    agent any
    // environment {
    //     PATH = "/opt/maven/bin/:$PATH"
    // }
    tools {
        maven '3.9.12'
    }
    stages {
        stage('gitcheckout') { 
            steps {
                git branch: 'main', url: 'https://github.com/devopssachin14/Devops-projet-1.git'
            }
        }
        stage('maven-check') { 
            steps {
                sh 'mvn --version'
            }
        }
        stage('maven-build') { 
            steps {
                sh 'mvn -B -DskipTests clean package'
                sh 'mvn validate'
                sh 'mvn install'
            }
        }
        stage('validation') { 
            steps {
                sh 'mvn validate'
            }
        }
        stage('code review') { 
            steps {
               withSonarQubeEnv(credentialsId: 'sonartoken', installationName: SonarQubeServer) {
                 sh "mvn clean verify sonar:sonar \
                    -Dsonar.projectKey=project \
                    -Dsonar.host.url=http://34.201.144.91:9000 \
                    -Dsonar.login=sqp_52e297725409cfe093234e0e95a6886449f0b976"
                }
            }
        }
    }
}
