#!/bin/bash
changeAliyuns()
{
    mv /etc/apt/sources.list /etc/apt/sources.list.back
    echo "deb http://mirrors.cloud.aliyuncs.com/ubuntu xenial-security main
deb-src http://mirrors.cloud.aliyuncs.com/ubuntu xenial-security main
deb http://mirrors.cloud.aliyuncs.com/ubuntu xenial-security universe
deb-src http://mirrors.cloud.aliyuncs.com/ubuntu xenial-security universe" >/etc/apt/sources.list
    echo "ok"
}
changeAliyun()
{
    mv /etc/apt/sources.list /etc/apt/sources.list.back
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted 
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed universe multiverse" >/etc/apt/sources.list
    echo "ok"
}
changeDockerAliyuns()
{
    mkdir -p /etc/docker
    tee /etc/docker/daemon.json <<-'EOF'
    {
        "registry-mirrors": ["https://vwcwqsm0.mirror.aliyuncs.com"]
    }
EOF
    systemctl daemon-reload
    systemctl restart docker
    echo "ok"
}
setupWgetAndNano()
{
    apt update
    apt install -y wget
    apt install -y nano
    echo "ok"
}
printa()
{
    echo "干你妹"
}

echo "注意这里是Ubuntu 18.04的脚本 by:Wenan"
echo "版本:1.0"
echo "WenanLee@outlook.com"
echo "1:设置Aliyuns源"
echo "2:设置Aliyun源"
echo "3:设置Docker Aliyun源"
echo "13:docker Ubuntu 安装 wget nano"
echo "0:退出"
while true
do
    echo "请输入操作编号:↓"
    if read x
        then
            case $x in
                1)  changeAliyuns
                ;;
                2)  changeAliyun
                ;;
                3)  changeDockerAliyuns
                ;;
                4)  echo "4444"
                printa                
                ;;
                13)  setupWgetAndNano  
                ;;
                0)  exit 0
                ;;
            esac
    fi
done

