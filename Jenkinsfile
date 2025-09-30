pipeline {
    agent {
        label 'win-dev'
    }

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Checkout Repo') {
            steps {
                // Clean workspace before cloning
                cleanWs()

                bat 'git --version'

                dir('D:\\jenkins-workspace\\workspace') {
                    bat 'git clone -b main https://github.com/sms-codecloud/arj-infra.git'
                }
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_secrets_shankar']
                ]) {
                    dir('D:\\jenkins-workspace\\workspace\\arj-infra\\s3') {
                        bat """
                            set AWS_ACCESS_KEY_ID=%AWS_ACCESS_KEY_ID%
                            set AWS_SECRET_ACCESS_KEY=%AWS_SECRET_ACCESS_KEY%

                            terraform init
                            terraform plan
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
    }
}
