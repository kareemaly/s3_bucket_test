
pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }

    stages {
        stage('Build') {
            steps {
                sh "aws s3api list-buckets"
            }
        }
        stage('Preparation') {
            steps {
                echo 'Preparation'
            }
        }
        stage('Deployment') {
            steps {
                sh """
                    aws s3 cp ../v1.0.0 s3://kareem-test-s3-bucket/v1.0.0
                """
            }
        }
    }
}
