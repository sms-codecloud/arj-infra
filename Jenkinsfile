pipeline {
    agent { label 'win-dev' }
    environment { TF_IN_AUTOMATION = "true" }

    stages {
        stage('Checkout Repo') {
            steps {
                cleanWs() // clear job workspace
                bat 'git --version'
                dir("${env.WORKSPACE}\\arj-infra") {
                    bat 'git clone -b main https://github.com/sms-codecloud/arj-infra.git .'
                }
            }
        }

        stage('Check PATH') {
            steps {
                bat 'echo %PATH%'
                bat 'where terraform'
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_secrets_shankar']]) {
                    dir("${env.WORKSPACE}\\arj-infra\\s3") {
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
