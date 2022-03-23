pipeline {
    agent { label 'MyLinux' }

    stages {
        
        stage('SCM') {
            steps {
                //sh 'sudo apk add --no-cache git'
                sh 'mvn --version'
                sh 'ls'
		            checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/luisgarciacheckmarx/Empty1']]]	);
            }
        }

    }
}
