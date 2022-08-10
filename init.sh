#解析ini配置文件的方法
function parseIni() {
    INIFILE=$1; SECTION=$2; ITEM=$3
    result=`awk -F '=' '/\['$SECTION'\]/{a=1}a==1&&$1~/'$ITEM'/{print $2;exit}' $INIFILE`
    #使用echo返回解析结果
    echo ${result}
} 

#下载项目需要的代码的方法
function init() {
    #获取./config中以config-xxx.ini格式的文件总共有多少个，每个配置文件对应一个md文件
    TOTAL_MD_COUNTS=`grep -n '^\[markdown-[1-9][0-9]\?\]' ./config/start.ini | cut -d':' -f2 | cut -d'-' -f2 | sed 's/\]//g'`
    echo '可以处理的md文件最大个数：'$TOTAL_MD_COUNTS
    #解析config.ini中配置要操作的md文件的名称，并根据配置对md文件进行增强
    for((a=1;a<=$TOTAL_MD_COUNTS;a++))
    do
        IS_ENHANCE=( $( parseIni ./config/start.ini markdown-$a enhance) )
        #如果启用了增强该md，则继续执行下一步
        if [ $IS_ENHANCE == "true" ]
        then
            #获取文件相对路径
            MD_FILE_RELATIVE_PATH=( $( parseIni ./config/start.ini markdown-$a relativePath) )

            #获取git仓库的地址
            GIT_REPOSITORY_URL=( $( parseIni ./config/start.ini markdown-$a gitRepositoryUrl) )

            #获取项目名称    
            PROJECT_NAME=( $( parseIni ./config/start.ini markdown-$a projectName) )
            
            #先判断是否存在该文件夹，就是判断项目需要的代码是否被已经被下载了
            if [ ! -d "$MD_FILE_RELATIVE_PATH/$PROJECT_NAME" ]
            then
                echo '代码还没有被下载过.....................................'
                #如果代码还没有被下载过，执行执行下载代码的操作
                git clone $GIT_REPOSITORY_URL $MD_FILE_RELATIVE_PATH/$PROJECT_NAME
                #写入commit-message
                curl -X GET --header 'Content-Type: application/json;charset=UTF-8' 'https://gitee.com/api/v5/repos/lingwh1995/'"$PROJECT_NAME"'/commits/master?access_token='"$1"'' > $MD_FILE_RELATIVE_PATH/$PROJECT_NAME/commit.txt
            else
                #如果存在该文件夹，则说明代码已经被下载过了，则对比最新的提交信息和当前项目中已经有的提交信息，看是否一致，不一致说明项目有新提交，需要重新下载
                echo '代码已经下载过了.....................................'
                #写入最新的commit信息
                curl -X GET --header 'Content-Type: application/json;charset=UTF-8' 'https://gitee.com/api/v5/repos/lingwh1995/'"$PROJECT_NAME"'/commits/master?access_token='"$1"'' > $MD_FILE_RELATIVE_PATH/$PROJECT_NAME/commit-new.txt
                #比较两个commit.txt文件是否相同
                DIFF_RESULT=`diff $MD_FILE_RELATIVE_PATH/$PROJECT_NAME/commit.txt $MD_FILE_RELATIVE_PATH/$PROJECT_NAME/commit-new.txt`  
                
                echo '比较结果：------------------------------------'
                echo $DIFF_RESULT
                echo '比较结果：------------------------------------'
                #diff执行结果不为空，说明有新提交，需要重新下载代码
                if [ ! -z "$DIFF_RESULT" ]
                then
                    echo '代码有更新，需要重新下载.....................................'
                    #重新下载代码前先删除上一次下载的代码
                    rm -rf $MD_FILE_RELATIVE_PATH/$PROJECT_NAME
                    #重新下载代码
                    git clone $GIT_REPOSITORY_URL $MD_FILE_RELATIVE_PATH/$PROJECT_NAME
                    #重新生成commit.txt信息
                    curl -X GET --header 'Content-Type: application/json;charset=UTF-8' 'https://gitee.com/api/v5/repos/lingwh1995/'"$PROJECT_NAME"'/commits/master?access_token='"$1"'' > $MD_FILE_RELATIVE_PATH/$PROJECT_NAME/commit.txt
                else
                    #diff执行结果为空，说明没有新提交，不做任何处理
                    echo '当前已是最新版本代码，不用重新下载.....................................'
                fi
            fi

            #删除代码文件夹中的.git文件
            rm -rf $MD_FILE_RELATIVE_PATH/$PROJECT_NAME/.git
        fi    
    done
}

#$1是jenkins执行这个脚本的时候传过来的$GITEE_TOKEN
init $1