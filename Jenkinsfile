def skipBranchBulds = true
if ( env.CHANGE_URL ) {
    skipBranchBulds = false
}

pipeline {
    environment {
        CLOUDSDK_CORE_DISABLE_PROMPTS = 1
        GIT_SHORT_COMMIT = sh(script: 'git describe --always --dirty', , returnStdout: true).trim()
        VERSION = "${env.GIT_BRANCH}-${env.GIT_SHORT_COMMIT}"
        AUTHOR_NAME  = sh(script: "echo ${CHANGE_AUTHOR_EMAIL} | awk -F'@' '{print \$1}'", , returnStdout: true).trim()
    }
    agent {
        label 'docker'
    }
    stages {
        stage('Prepare') {
            when {
                expression {
                    !skipBranchBulds
                }
            }
            steps {
                script {
                    if ( AUTHOR_NAME == 'null' )  {
                        AUTHOR_NAME = sh(script: "git show -s --pretty=%ae | awk -F'@' '{print \$1}'", , returnStdout: true).trim()
                    }  
                }
                withCredentials([file(credentialsId: 'PBM-AWS-S3', variable: 'PBM_AWS_S3_YML'), file(credentialsId: 'PBM-GCS-S3', variable: 'PBM_GCS_S3_YML')]) {
                    sh '''
                        sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        sudo chmod +x /usr/local/bin/docker-compose

                        cp $PBM_AWS_S3_YML ./e2e-tests/docker/conf/aws.yaml
                        cp $PBM_GCS_S3_YML ./e2e-tests/docker/conf/gcs.yaml
       
                        docker-compose -f ./e2e-tests/docker/docker-compose.yaml build
                        openssl rand -base64 756 > ./e2e-tests/docker/keyFile 
                        sudo chown 1001:1001 ./e2e-tests/docker/keyFile
                        sudo chmod 400 ./e2e-tests/docker/keyFile
                        mkdir ./e2e-tests/docker/mongodb
                        sudo chown 1001:1001 ./e2e-tests/docker/mongodb
                        sudo chown 1001:1001 ./e2e-tests/docker/scripts/start.sh
                    '''
                }
                sh '''
                    sleep 30000
                    docker-compose -f ./e2e-tests/docker/docker-compose.yaml up -d
                    sleep 300
                    docker-compose -f ./e2e-tests/docker/docker-compose.yaml ps
                    docker-compose -f ./e2e-tests/docker/docker-compose.yaml down
                '''
            }
        }
    }
    post {
        always {
            deleteDir()
        }
    }
}
