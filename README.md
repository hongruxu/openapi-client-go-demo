# 这是一个通过openapi生成go stub代码并用api调用接口的简单示例

## 功能介绍
1. 通过指定路径的openapi文档生成go 语言的 stub 代码
2. 编写简单示例调通过stub代码用openapi中的接口

## 实现原理
1. Makefile 中的 java-build 部分是按指定的 openapi文档生成 go 语言的 stub 代码
2. main.go中的函数是一个简单的调用接口的示例。可以看出来，通过几行简单代码就可以调用接口并以结构体的方式使用返回结果。
3. Make的过程中会根据是否已经生成swagger的stub代码决定编译工作。

## 编译环境
1. Java编译环境，需要通过 tools下的jar工具生成对应的go语言的stub代码
2. go编译环境，当生成stub后，可以直接编译代码，生成可执行程序

## 依赖项目
参考 [spring-boot-demo](https://github.com/hongruxu/demo)
示例代码中的接口来源上述项目
