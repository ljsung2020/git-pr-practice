pipeline {
    agent any

    environment {
        BUILD_DIR = "${WORKSPACE}"
        CONTAINER_NAME = "web-preview"
        HOST_PORT = "8888"
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

        stage('Serve with Nginx (Docker)') {
            steps {
                echo "🧪 Nginx 컨테이너로 웹 서버 실행"
                sh '''
                    docker rm -f $CONTAINER_NAME || true

                    docker run -d \
                        --name $CONTAINER_NAME \
                        -p $HOST_PORT:80 \
                        -v $BUILD_DIR:/usr/share/nginx/html:ro \
                        nginx

                    sleep 3

                    curl -sI http://localhost:$HOST_PORT/index.html | grep "200 OK" || {
                        echo "❌ index.html 접근 실패!"
                        docker logs $CONTAINER_NAME
                        exit 1
                    }
                '''
            }
        }

        stage('Deploy (Mock)') {
            steps {
                echo '🚀 실제 배포는 아직 연결 안됨 (추후에 Netlify, S3 등으로 가능)'
            }
        }
    }

    post {
        always {
            echo "🧹 컨테이너 정리"
            sh "docker rm -f $CONTAINER_NAME || true"
        }
    }
}

