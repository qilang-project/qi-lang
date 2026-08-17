# Qi 语言的 AI agent 技能

教 AI 编码助手怎么写 [Qi（奇语）](https://qilang.org) —— 一门 100% 中文关键字的编译型语言。

四个技能，装一次全都有：

| 技能 | 管什么 |
|---|---|
| **qi-lang** | 语言本身：语法、类型、特性/泛型、ARC、真协程、**语言级 LLM 原语**（`询问::<T>` 结构化输出、流式、嵌入、磁带）、标准库、工具链、包管理 |
| **qi-web** | HTTP 框架 + **LiveView**（服务端渲染 + DOM morph 局部 patch + 客户端 hook） |
| **qi-cli** | Cobra 风格命令行框架 |
| **qi-harness** | LLM Agent 框架：agent loop、工具派发、图控制流与断点续跑、评估、追踪、MCP |

## 装

**Claude Code**（推荐，能升级能卸载）：

```
/plugin marketplace add qilang-project/qi-lang
/plugin install qilang@qilang
```

**Codex**，或任何读 `~/.codex/skills` / `~/.claude/skills` 的工具：

```bash
git clone https://github.com/qilang-project/qi-lang.git
cd qi-lang && ./install.sh
```

脚本把 `skills/` 下每个目录软链过去（不是拷贝），所以之后 `git pull` 一下技能就更新了。
也可以指定目录：`./install.sh ~/某处/skills`。

**手动**：把 `skills/qi-lang`、`skills/qi-web`、`skills/qi-cli`、`skills/qi-harness`
四个目录复制到你的助手读技能的位置即可 —— 就是普通的 `SKILL.md` + `references/`，没有别的机关。

## 它们是怎么维护的

技能里的每条断言都对着**当前发布版**验过，不是照着记忆写的。带 ⚠️ 的坑基本都是
真踩过一次才写进去的，所以过时的条目会被明确划掉而不是留在那儿 —— 比如
「二进制静态文件发不出、要 base64 内联」那条曾经是真的，2026-08 改成 sendfile
字节直发之后就作废了，文档里现在写的是它作废了。

当前对齐版本：**qi 2026.08.16-3**。

## 不装也能试

- 浏览器里跑：<https://play.qilang.org>
- 装编译器：`curl -fsSL https://raw.githubusercontent.com/qilang-project/qi/main/scripts/install.sh | bash`
- 第三方包：<https://pkg.qilang.org>

## License

MIT
