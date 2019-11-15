
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
                sh """
                    cd terraform
                    terraform init
                    terraform plan -out=s3.plan
                    terraform apply s3.plan
                """
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
