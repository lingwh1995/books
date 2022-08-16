pipeline {
  agent any
  stages {
    stage('检出') {
      steps {
        echo '开始检出...'
        checkout([
          $class: 'GitSCM',
          branches: [[name: env.GIT_BUILD_REF]],
          userRemoteConfigs: [[url: env.GIT_REPO_URL, credentialsId: env.CREDENTIALS_ID]]
        ])
        echo '结束检出...'
      }
    }
    
    stage('执行下载代码的脚本') {
      steps {
        echo '正在下载博客所引用的代码...'
        sh 'chmod +x ./init.sh'
        sh 'bash ./init.sh ${GITEE_TOKEN}'
        sh 'git add .'
        sh "git commit -m '更新项目依赖的代码'"
        echo '完成下载博客所引用的代码...'
      }
    }

    stage('推送部署到GITEE') {
      steps {
        echo '正在推送文件...'
        echo '${GIT_COMMIT_MSG}'
        //sh 'git fetch https://lingwh1995:${GITEE_TOKEN}@gitee.com/lingwh1995/books.git'
        sh 'git push -f https://lingwh1995:${GITEE_TOKEN}@gitee.com/lingwh1995/books.git HEAD:master'
        //sh 'git fetch https://lingwh1995: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@github.com/lingwh1995/springcloud-eureka.git'
        //sh 'git push -f https://lingwh1995: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@github.com/lingwh1995/springcloud-eureka.git HEAD:master'
        echo '完成文件推送...'
      }
    }
  }
}