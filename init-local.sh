#使用前需要安装Markdown Preview Enhanced这个插件
#中文官网：https://shd101wyy.github.io/markdown-preview-enhanced/#/zh-cn/
:<< EOF
这个脚本的用途：
    1.在本地编辑xxx.md文件时如果要引用到代码文件，执行一下这个脚本，可以从远程仓库拉取最新版本的代码
    2.如果GITEE中springcloud-eureka的代码更新了，这个脚本需要在本地手动执行一下
    3.不执行这个脚本会有如下效果：
        -编写xxx.md无法引用到需要的代码
    4.只执行一次这个脚本会有如下效果：
        -编写xxx.md可以引用到需要的代码，但是这个代码带概率不是最新版本，除非引用的代码已经稳定不再更改       
        -持续集成时，将CODINGS中books同步到GITEE中books前，会再执行从GITEE拉取xxx.md引用的代码这个操作
    5.多次执行这个脚本会有如下效果：
        -本地编写xxx.md时引用的是最新版本的代码
        -持续集成时，将CODINGS中books同步到GITEE中books前，不会再执行从GITEE拉取xxx.md引用的代码这个操作
    6.综上所述
        -这个脚本最少在每次需要引用新的代码时执行一次
        -如果不想多次执行也是可以的，但是尽量每次GITEE中引用的代码更新了，这个脚本都在本地执行一下
EOF

./init.sh 04cacc5f135e93b1ed679462a55260b7