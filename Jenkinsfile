@Library('my-shared-library')

pipeline {
    agent any

    stages {
	stages('Deploy') {
	    steps {
		deployApp('staging')
	    }
	}
    }
}
