pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Preview (Local Server)') {
            steps {
                echo '🧪 임시로 Python HTTP 서버 실행'
                sh '''
                    python3 -m http.server 8080 > /dev/null 2>&1 &
                    sleep 5
                    curl -I http://localhost:8080/index.html || true
                    pkill -f "python3 -m http.server"
                '''
            }
        }
    }
}

