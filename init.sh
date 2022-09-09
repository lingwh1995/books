#解析ini配置文件的方法
function parseIni() {
    INIFILE=$1; SECTION=$2; ITEM=$3
    result=`awk -F '=' '/\['$SECTION'\]/{a=1}a==1&&$1~/'$ITEM'/{print $2;exit}' $INIFILE`
    #使用echo返回解析结果
    echo ${result}
}

#更新项目需要的代码的方法
function downloadDependentCode() {
    #获取./config中以config-xxx.ini格式的文件总共有多少个，每个配置文件对应一个md文件
    TOTAL_MD_COUNTS=`grep -n '^\[markdown-[1-9][0-9]\?\]' ./enhance/bootstrap.ini | tail -1 | cut -d':' -f2 | cut -d'-' -f2 | sed 's/\]//g'`
    echo '可以处理的md文件最大个数：'$TOTAL_MD_COUNTS
    #解析config.ini中配置要操作的md文件的名称，并根据配置对md文件进行增强
    for((a=1;a<=$TOTAL_MD_COUNTS;a++))
    do
        CLONE_STATE=( $( parseIni ./enhance/bootstrap.ini markdown-$a clone) )
        echo markdown-$a'的增强启用状态:'$CLONE_STATE
        #如果启用了增强该md，则继续执行下一步
        if [ $CLONE_STATE == "true" ]
        then
            #获取项目名称
            PROJECT_NAMES_STR=( $( parseIni ./enhance/bootstrap.ini markdown-$a projectNames) )
            PROJECT_NAMES_ARR=(`echo $PROJECT_NAMES_STR | tr ',' ' '` )

            #获取文件相对路径
            MD_FILE_RELATIVE_PATH=( $( parseIni ./enhance/bootstrap.ini markdown-$a relativePath) )

            #获取git仓库的地址
            GIT_REPOSITORY_URLS_STR=( $( parseIni ./enhance/bootstrap.ini markdown-$a gitRepositoryUrls) )
            GIT_REPOSITORY_URLS_ARR=(`echo $GIT_REPOSITORY_URLS_STR | tr ',' ' '` )

            for((i=0;i<${#PROJECT_NAMES_ARR[@]};i++));
            do
                PROJECT_NAME=${PROJECT_NAMES_ARR[i]}
                GIT_REPOSITORY_URL=${GIT_REPOSITORY_URLS_ARR[i]}

                #删除旧的代码
                rm -rf $GIT_REPOSITORY_URL $MD_FILE_RELATIVE_PATH/projects/$PROJECT_NAME
                echo '正在下载博客所引用的代码...'
                #下载代码
                git clone $GIT_REPOSITORY_URL $MD_FILE_RELATIVE_PATH/projects/$PROJECT_NAME
                echo '完成下载博客所引用的代码...'
                #删除多余的.git文件
                rm -rf $MD_FILE_RELATIVE_PATH/projects/$PROJECT_NAME/.git
            done
        fi
    done
}

#触发blog项目自动构建，将books中最新内容发布到GITHUB/GITEE中博客网站中
function autoCI() {
    AUTO_CI_STATE=( $( parseIni ./enhance/plugins.ini plugin-001 enable) )

    if [ $AUTO_CI_STATE == "true" ]
    then
        #判断系统类型
        uNames=`uname -s`
        osName=${uNames: 0: 4}
        if [ "$osName" == "Linu" ] # Linux
        then
            #代表持续集成环境
            echo "GNU/Linux"
            curl -u ptv14olf3rna:8191f89675310e5072257ce11572ef295ba14a66 \
            -v -X POST  'https://lingwh.coding.net/api/cci/job/1461498/trigger' \
            -H 'Content-Type: application/json' \
            -d '{"ref": "master","envs": []}'
        elif [ "$osName" == "MING" ] # MINGW, windows, git-bash
        then
            #代表本地环境，不触发博客自动持续集成
            echo "Windows, git-bash"
        else
            echo "unknown os"
        fi
    fi
}

function init() {
    downloadDependentCode
    autoCI
}

init

#使用前需要安装Markdown Preview Enhanced这个插件
#中文官网：https://shd101wyy.github.io/markdown-preview-enhanced/#/zh-cn/
:<< EOF
这个脚本的用途：
    1.在本地编辑xxx.md文件时如果要引用到代码文件，执行一下这个脚本，可以从远程仓库拉取xxx.md需要的代码
    2.执行这个脚本时候,如果是在远程持续集成机器上执行,则会触发博客项目自动持续集成
EOF
