// Package main 一个简单的使用 swagger 根据 openapi生成 stub 并调用的示例
package main

import (
	"context"
	"fmt"

	"github.com/hongruxu/openapi-client-go-demo/swagger"
)

func main() {
	// 新建一个api客户端
	// 配置通过方法New出来的时候会根据生成stub文件时候的参数生成请求地址
	api := swagger.NewAPIClient(swagger.NewConfiguration())
	// swagger会根据分组去生成对应的api,此示例只生成了user组
	// 发送一个查询请求
	res, httpRes, err := api.GetAllUserApi.GetUser(context.Background())
	if err != nil {
		fmt.Printf("call err :%v\n", err)
		return
	}
	// 输出原始http回包头，包体被读出来做结构化返回了，无法再读出原始包体
	fmt.Printf("http response header:%v\n", httpRes.Header)
	// 输出结构化的返回数据
	fmt.Printf("struce resulet is :\n")
	for _, v := range res {
		fmt.Printf("%+v\n", v)
	}
}
