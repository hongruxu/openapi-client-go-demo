# 这是一个根据openapi生成go stub代码并用api调用接口的简单示例

## 功能介绍
1. 通过指定路径的openapi文档生成go 语言的 stub 代码。详细配置见Makefile文件
2. 编写简单示例调通过stub代码用openapi中的接口

## 实现原理
1. Makefile 中的 java-build 部分是按指定的 openapi文档生成 go 语言 stub 代码的过程
2. main.go中的函数是一个简单的调用接口的示例。引用到的包为第1步生成的包。可以看出来，通过几行简单代码就可以调用接口并以结构体的方式使用返回结果。
3. Make的过程中会根据是否已经生成swagger的stub代码决定编译工作。

## 编译环境
1. 需要有 make 环境能执行 Makefile
2. Java编译环境，需要通过 tools下的jar工具生成对应的go语言的stub代码
3. go编译环境，当生成stub后，可以直接编译代码，生成可执行程序

## 编译过程
1. clone 代码：git clone https://github.com/hongruxu/openapi-client-go-demo.git
2. 进入对应目录：cd openapi-client-go-demo
3. 编译：make
4. 执行：./openenapi-client-go-demo

执行结果
```
http response header:map[Content-Type:[application/json] Date:[Mon, 29 Sep 2025 13:54:42 GMT]]
struce resulet is :
{Id:1 UserName:张三22 Email:example@qq.com Age:20}
{Id:4 UserName:aaa Email:aaa@qq.com Age:20}
{Id:5 UserName:bbb Email:bbb@qq.com Age:21}
{Id:6 UserName:ccc Email:ccc@qq.com Age:22}
{Id:7 UserName:ddd Email:ddd@qq.com Age:23}
{Id:8 UserName:eee Email:eee@qq.com Age:24}
{Id:9 UserName:张a Email:example@qq.com Age:25}
```

## 依赖项目
参考 [spring-boot-demo](https://github.com/hongruxu/demo)
示例代码中的接口来源上述项目
