# qi-lang

**奇语（Qi）** 编程语言的 AI agent skill 定义 —— 教 AI 编码助手准确编写、理解、调试 Qi 代码。

> 奇语是一门 100% 中文关键字、编译到原生机器码（LLVM 21）的编程语言。官网：https://qilang-project.github.io/

## 这是什么

瘦 `SKILL.md` + 按需加载的参考文件，对应语言 2026.07.03-2 版，**所有代码示例均在真实编译器上验证通过**：

```
qi-lang/
├── SKILL.md              # 触发面 + 程序结构速查 + 高频坑清单（14 条实测坑）+ 参考文件路由表
└── references/
    ├── 语法参考.md        # 类型/控制流/函数(默认参数/变参)/结构体与方法/闭包/异常/字符串/数组/保留字
    ├── 标准库.md          # 按模块组织的核心 API + FFI 返回值约定表
    ├── 并发异步.md        # 启动(goroutine)/通道/未来<T>与等待/协程异常队列/同步原语
    ├── 工具链.md          # CLI 双语命令/-O 优化/Linux 交叉编译/qi test/qifmt/ARC 内存管理
    └── 包管理.md          # qi.toml 依赖三种写法/qi get 与缓存/导入解析顺序/多文件项目组织
```

覆盖的语言现状（2026.07 起的重大能力）：

- **ARC 自动引用计数**默认开启（字符串/结构体/数组/闭包环境），`QI_ARC=0` 调试开关、`QI_RC_REPORT=1` 泄漏检测
- **异常机制**完整可用：尝试/捕获/最终/抛出，goroutine 异常入队查询，future 出错经 等待 传播
- **包管理**：qi.toml 清单 + `qi get` 远程依赖 + qi.lock 锁定，编译期零联网
- **交叉编译**：macOS 一条命令出 Linux ELF（x86_64/aarch64，zig 链接）
- 变参函数、默认参数、`对于 x 在 数组` 遍历、`qi test` 测试发现
- 以及大量"能解析但 codegen 无效"的陷阱清单（匹配/选择/跳出/继续/f-string/数组下标赋值…）

## 怎么用

作为 agent skill 安装（任意支持 skills 的 AI 编码工具）：

```bash
npx skills add https://github.com/qilang-project/qi-lang
```

或手动把整个目录（`SKILL.md` + `references/`）放进你的 agent skills 目录。

## 配套技能

| 技能 | 用途 |
|---|---|
| **qi-lang**（本仓库） | 语言本体 + 标准库 + 工具链 |
| [qi-web](https://github.com/qilang-project/qi-web) | Web 框架 |
| [qi-cli](https://github.com/qilang-project/qi-cli) | 命令行框架 |
| [qi-harness](https://github.com/qilang-project/qi-harness) | LLM Agent 框架 |

## License

MIT
