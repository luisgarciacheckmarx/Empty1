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
            
		    step([$class: 'CxScanBuilder', comment: 'hola perola', configAsCode: true, credentialsId: 'CxSAST94', customFields: '', excludeFolders: '', exclusionsSetting: 'global', failBuildOnNewResults: false, failBuildOnNewSeverity: 'HIGH', filterPattern: '''!**/_cvs/**/*, !**/.svn/**/*, !**/.hg/**/*, !**/.git/**/*, !**/.bzr/**/*,
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
        		!OSADependencies.json, !**/node_modules/**/*''', fullScanCycle: 10, groupId: '1', password: '{AQAAABAAAAAQQQTKlo9uDBg6wl7ocSOUHPeRfeWilX1xSLnCCBxsOj4=}', postScanActionId: 2, preset: '36', projectName: 'Empty1', sastEnabled: true, serverUrl: 'http://172.35.1.19', sourceEncoding: '6', useOwnServerCredentials: true, username: '', vulnerabilityThresholdResult: 'FAILURE', 
			waitForResultsEnabled: false])
		    
		    
	    }
        }    
	    
	stage('Cxconsole') {
            steps {
		script {
					
			def tempDir = pwd(tmp: true)
			dir(tempDir) {
				sh 'rm -f *'
				sh 'wget https://download.checkmarx.com/9.4.0_GA/Plugins/CxConsolePlugin-1.1.10.zip'
                        	sh 'unzip CxConsolePlugin-1.1.10.zip'
                        	//sh 'rm -rf ScaResolver.tar.gz'
                        	//sh 'chmod +x ScaResolver'
                        	sh 'echo "Current directory: $(pwd)"'
                        	sh 'ls -latr $(pwd)'
				
				sh 'runCxConsole.sh Scan -v -ProjectName "Empty1" -CxServer http://172.35.1.19 -cxuser admin -cxpassword 4g#Tj8H12 -LocationType folder -LocationPath ${WORKSPACE} -preset "Checkmarx Default"'
				
				//  withCredentials([usernamePassword(credentialsId: 'SCA', passwordVariable: 'pass', usernameVariable: 'user')]) { 
				//	sh 'echo hola $user'
				//  	sh './ScaResolver -a ps-team-emea -u luis.garciaviejo@checkmarx.com -p $pass -s ${WORKSPACE} --report-path ${WORKSPACE} --report-type Risk --report-extension Pdf,Json,Xml -n Pipeline_SCAResolver_SlaveUnix2 --bypass-exitcode'
				//}		
				}
			}
            	}
	}    
	    
	    

    }
}
