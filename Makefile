# 定义变量
GO_STUB_DIR := swagger
JAR_FILE := ./tools/swagger-codegen-cli.jar
BUILD_TARGET := build
OPENAPI_DOC := http://114.132.58.71:9999/api-docs/user
OUT_FILE := openapi-client-go-demo
.PHONY: all $(BUILD_TARGET) 

# 默认目标
all: $(BUILD_TARGET)

# 主要构建目标
$(BUILD_TARGET):
	@if [ -d "$(GO_STUB_DIR)" ] && [ -n "$$(find "$(GO_STUB_DIR)" -name '*.go' -type f | head -n 1)" ]; then \
		echo "检测到 $(GO_STUB_DIR) 目录且包含 .go 文件，执行 Go 构建..."; \
		go build -o ${OUT_FILE}; \
	else \
		echo "未检测到 $(GO_STUB_DIR) 目录或 .go 文件，执行 Java 构建..."; \
		$(MAKE) java-build; \
		go build -o ${OUT_FILE}; \
	fi

# Java 构建目标
java-build:
	@echo "执行 Java 构建..."
	java -jar $(JAR_FILE) generate \
	-i ${OPENAPI_DOC} \
 	-l go \
 	-o ./${GO_STUB_DIR}/ 

# 清理目标
clean:
	@echo "清理构建文件..."
	@if [ -d "$(GO_STUB_DIR)" ]; then \
		rm -rf -d $(GO_STUB_DIR); \
	fi
	@if [ -f "${OUT_FILE}" ]; then \
		rm -f ${OUT_FILE}; \
	fi

# 显示帮助信息
help:
	@echo "可用目标:"
	@echo "  all       - 默认构建目标（根据条件选择 Go 或 Java 构建）"
	@echo "  build     - 条件构建"
	@echo "  java-build - 强制执行 Java 构建"
	@echo "  clean     - 清理构建文件"
	@echo "  help      - 显示此帮助信息"

# 检查环境
check-env:
	@echo "检查构建环境..."
	@if [ -d "$(GO_STUB_DIR)" ]; then \
		echo "✓ 找到目录: $(GO_STUB_DIR)"; \
		if [ -n "$$(find "$(GO_STUB_DIR)" -name '*.go' -type f | head -n 1)" ]; then \
			echo "✓ 找到 .go 文件"; \
			echo "环境: 适合 Go 构建"; \
		else \
			echo "✗ 未找到 .go 文件"; \
			echo "环境: 适合 Java 构建"; \
		fi; \
	else \
		echo "✗ 未找到目录: $(GO_STUB_DIR)"; \
		echo "环境: 适合 Java 构建"; \
	fi
	@if [ -f "$(JAR_FILE)" ]; then \
		echo "✓ 找到 JAR 文件: $(JAR_FILE)"; \
	else \
		echo "✗ 未找到 JAR 文件: $(JAR_FILE)"; \
	fi
