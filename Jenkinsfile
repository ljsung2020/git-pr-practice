pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-static-site'
        CONTAINER_NAME = 'web-preview'
        HOST_PORT = '8888'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo "🔨 Docker 이미지 빌드"
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Container') {
            steps {
                echo "🚀 컨테이너 실행"
                sh '''
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p $HOST_PORT:80 $IMAGE_NAME
                '''
            }
        }

        stage('Test Access') {
            steps {
                echo "🌐 index.html 접근 테스트"
                sh '''
                    sleep 2
                    curl -sI http://localhost:$HOST_PORT/index.html | grep "200 OK" || (echo "❌ 접근 실패!" && exit 1)
                '''
            }
        }
    }

    post {
        success {
            echo "✅ http://<서버IP>:8888 에서 웹 확인 가능"
        }
        failure {
            echo "❌ 빌드 실패 - 로그 확인 필요"
        }
    }
}

