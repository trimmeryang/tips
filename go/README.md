# 配置GOPATH
```
vim .bash_profile
########################################
export GOROOT=/usr/local/go   #根据自己系统go安装目录修改，具体可以使用 go env 查看目录所在
export GOPATH=/Users/XXXXXX/go #根据自己习惯指定目录
export PATH=$PATH:$GOROOT/bin:${GOPATH//://bin:}/bin
########################################
source ~/.bash_profile  #配置立马生效
go env  # 查看GOPATH设置结果
```

# go mod timeout
```
export GO111MODULE=on
export GOPROXY=https://goproxy.io或者export GOPROXY=https://goproxy.cn
```
