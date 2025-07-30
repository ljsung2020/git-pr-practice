@Library('my-shared-library') _

pipeline {
    agent any

    stages {
	stage('Deploy') {
	    steps {
		deployApp('staging')
	    }
	}
    }
}
