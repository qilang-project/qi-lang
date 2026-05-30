# qi-lang

**奇语（Qi）** 编程语言的 AI agent skill 定义 —— 教 AI 编码助手准确编写、理解、调试 Qi 代码。

> 奇语是一门 100% 中文关键字、编译到原生机器码的编程语言。官网：https://qilang-project.github.io/

## 这是什么

[`SKILL.md`](SKILL.md) 是一个 agent skill，覆盖：

- 基础语法（包/函数/变量/类型/控制流/结构体/方法/匹配）
- 完整关键字列表 + **保留字地雷**（`结果`/`类型` 等不能做变量名，附原因）
- **类型系统真实映射**（`整数` → i64 等）
- 标准库 25+ 模块用法（HTTP/JSON/网络/加密/时间/字符串…）
- **FFI 返回值约定**（`读取文件` 失败返回空串、`写入文件` 1=成功 等）
- 并发编程（通道/协程/select）
- CLI 命令、常见错误与解决、完整示例

## 怎么用

作为 agent skill 安装（任意支持 skills 的 AI 编码工具）：

```bash
npx skills add https://github.com/qilang-project/qi-lang
```

或手动把 `SKILL.md` 放进你的 agent skills 目录。

## 配套技能

| 技能 | 用途 |
|---|---|
| **qi-lang**（本仓库） | 基础语言语法 |
| [qi-web](https://github.com/qilang-project/qi-web) | Web 框架 |
| [qi-cli](https://github.com/qilang-project/qi-cli) | 命令行框架 |
| [qi-harness](https://github.com/qilang-project/qi-harness) | LLM Agent 框架 |

## License

MIT
