pipeline {
    agent {
        label 'dev-wsl'   // make sure your WSL agent has this label
    }

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Checkout Repo') {
            steps {
                // Use WSL Git
                sh 'git --version'  // sanity check
                dir('/home/shankar/workspace') {
                    sh '''
                        git clone -b x https://github.com/sms-codecloud/arj-infra.git .
                    '''
                }
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_secrets_shankar']
                ]) {
                    dir('/home/shankar/workspace/arj-infra/s3') { // your terraform folder
                        sh '''
                            export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                            export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

                            terraform init
                            terraform plan
                        '''
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
