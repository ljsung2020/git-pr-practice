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
		deployApp('staging')
	    }
	}
    }
}
