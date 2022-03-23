pipeline {
    agent { label 'MyLinux' }

    stages {
        
        stage('SCM') {
            steps {
                //sh 'sudo apk add --no-cache git'
                sh 'mvn --version'
                sh 'ls'
		checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/luisgarciacheckmarx/Empty1']]]	);
            }
        }
	    
	stage('SAST scan') {
            steps {
            
		    step([$class: 'CxScanBuilder', comment: 'hola', configAsCode: true, credentialsId: 'CxSAST94', customFields: '', excludeFolders: '', exclusionsSetting: 'global', failBuildOnNewResults: false, failBuildOnNewSeverity: 'HIGH', filterPattern: '''!**/_cvs/**/*, !**/.svn/**/*, !**/.hg/**/*, !**/.git/**/*, !**/.bzr/**/*,
        		!**/.gitgnore/**/*, !**/.gradle/**/*, !**/.checkstyle/**/*, !**/.classpath/**/*, !**/bin/**/*,
        		!**/obj/**/*, !**/backup/**/*, !**/.idea/**/*, !**/*.DS_Store, !**/*.ipr, !**/*.iws,
        		!**/*.bak, !**/*.tmp, !**/*.aac, !**/*.aif, !**/*.iff, !**/*.m3u, !**/*.mid, !**/*.mp3,
        		!**/*.mpa, !**/*.ra, !**/*.wav, !**/*.wma, !**/*.3g2, !**/*.3gp, !**/*.asf, !**/*.asx,
        		!**/*.avi, !**/*.flv, !**/*.mov, !**/*.mp4, !**/*.mpg, !**/*.rm, !**/*.swf, !**/*.vob,
        		!**/*.wmv, !**/*.bmp, !**/*.gif, !**/*.jpg, !**/*.png, !**/*.psd, !**/*.tif, !**/*.swf,
        		!**/*.jar, !**/*.zip, !**/*.rar, !**/*.exe, !**/*.dll, !**/*.pdb, !**/*.7z, !**/*.gz,
        		!**/*.tar.gz, !**/*.tar, !**/*.gz, !**/*.ahtm, !**/*.ahtml, !**/*.fhtml, !**/*.hdm,
        		!**/*.hdml, !**/*.hsql, !**/*.ht, !**/*.hta, !**/*.htc, !**/*.htd, !**/*.war, !**/*.ear,
        		!**/*.htmls, !**/*.ihtml, !**/*.mht, !**/*.mhtm, !**/*.mhtml, !**/*.ssi, !**/*.stm,
        		!**/*.bin,!**/*.lock,!**/*.svg,!**/*.obj,
        		!**/*.stml, !**/*.ttml, !**/*.txn, !**/*.xhtm, !**/*.xhtml, !**/*.class, !**/*.iml, !Checkmarx/Reports/*.*,
			jobStatusOnError: 'UNSTABLE',
        		!OSADependencies.json, !**/node_modules/**/*''', fullScanCycle: 10, groupId: '1', password: '{AQAAABAAAAAQQQTKlo9uDBg6wl7ocSOUHPeRfeWilX1xSLnCCBxsOj4=}', postScanActionId: 2, preset: '36', projectName: 'Empty1', sastEnabled: true, serverUrl: 'http://172.35.1.19', sourceEncoding: '6', useOwnServerCredentials: true, username: '', vulnerabilityThresholdResult: 'FAILURE', waitForResultsEnabled: true])
		    
		    
	    }
        }    
	    

    }
}
