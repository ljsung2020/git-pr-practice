pipeline {
    agent any

    environment {
        BUILD_DIR = "${WORKSPACE}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "✅ 코드 체크아웃 완료: ${BUILD_DIR}"
            }
        }

        stage('Validate Files') {
            steps {
                echo "📂 파일 목록 확인:"
                sh 'ls -l'
                sh '''
                    test -f index.html || (echo "❌ index.html 없음!" && exit 1)
                    test -f style.css || (echo "❌ style.css 없음!" && exit 1)
                '''
            }
        }

        stage('Start Local Server') {
            steps {
                echo "🧪 Python HTTP 서버 실행 후 테스트"
                sh '''
                    nohup python3 -m http.server 8080 > server.log 2>&1 &
                    sleep 3
                    curl -sI http://localhost:8080/index.html | grep "200 OK" || (echo "❌ index.html 접근 실패!" && cat server.log && exit 1)
                    pkill -f "python3 -m http.server"
                '''
            }
        }

        stage('Deploy (Mock)') {
            steps {
                echo '🚀 실제 배포는 아직 연결 안됨 (추후에 Netlify, S3 등으로 가능)'
            }
        }
    }
}

