# OpenSergo gRpc Stub 【OpenSergog gRpc 存根 管理平台】

- 生成`stub code`，参考[`gen-stub`目录中的 README.md](./gen-stub/README.md)
- 发布`stub code`到`中央仓库`  
  opensergo-grpc-java，发布到`maven中央仓库`(暂无发布账号)，故，需要在`opensergo-grpc-java`目录本地`mvn install`进行测试  
  opensergo-grpc-go， 发布到`github`，暂时发布地址为 [jnan806/opensergo-protocol-grpc-go](https://github.com/jnan806/opensergo-protocol-grpc-go)
- 正式版规划，采用 `github CI`自动进行上诉步骤




# 示例Demo

项目生成`stub code`主要用于`OpenSergo SDK`基于`gRpc协议`的依赖

- opensergo-grpc-java : [jnan806/opensergo-java-sdk-review-sczyh30 的 buf.build-based-sczyh30 分支](https://github.com/jnan806/opensergo-java-sdk-review-sczyh30/tree/buf.build-based-sczyh30)  
  注意：在编译 [jnan806/opensergo-java-sdk-review-sczyh30 ](https://github.com/jnan806/opensergo-java-sdk-review-sczyh30/tree/buf.build-based-sczyh30) 时，应先将`opensergo-grpc-stub`中的`opensergo-grpc-java`本地安装`mvn install`
- opensergo-grpc-go : [jnan806/opensergo-go-sdk 的 dependency_of_opensergo-protocol-grpc-go 分支](https://github.com/jnan806/opensergo-go-sdk/tree/dependency_of_opensergo-protocol-grpc-go)  