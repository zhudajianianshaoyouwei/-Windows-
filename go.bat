@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
chcp 65001
title 自动下载视频脚本(布尔值为true或false)
ECHO 显示此消息代表utf-8编码已切换将在五秒后自动销毁
timeout /nobreak /t 5
cls
SET /P python=请输入你是否安装python(请用布尔值回答):
IF %python%==true (
    echo 好的，请进行下一步操作!
) ELSE (
    echo 安装时请勾选pip
    start python.exe
)
SET /P you-get=请输入你是否安装you-get(请用布尔值回答):
IF %you-get%==false (
    echo OK，正在帮你安装you-get
    pip install you-get
    ECHO Success!
    timeout /nobreak /t 3
    cls
) ELSE (
    echo 好的，请进行下一步操作！
)
:A
SET /P aas=视频名称:
SET /P wangzhi=网址（URL）:
you-get -c cookies.sqlite -o ./ -O %aas% %wangzhi%
del /S /Q *.xml
type type.txt
SET /P panduan=请输入是否重新运行程序：
IF %panduan%==true (
    echo 正在重新运行此程序
    timeout /nobreak /t 3
    cls
    goto A
)
pause