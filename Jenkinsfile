@Library('my-shared-library') _

pipeline {
    agent any

    stages {
	stage('Build') {
	    steps {
		buildApp('my-web-app')
	    }
	}
	stage('Deploy') {
	    steps {
		script {
		    def branch = env.GIT_BRANCH?.replace('origin/', '')
		    if(branch == 'main') {
			echo "Main branch detected: Deploying to PRODUCTION"
			deployApp('production')
		    } else {
			echo "Non-main branch detected: Deploying to STAGING"
			deployApp('staging', 'nginx:1.21-alpine')
		    }
		}
	    }
	}
    }
}
