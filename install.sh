#!/usr/bin/env bash
# 把这四个技能装进 Claude Code / Codex / 任何读 SKILL.md 的 agent。
#
# Claude Code 用户其实不用跑这个脚本 —— 用插件市场更好（能升级、能卸载）：
#   /plugin marketplace add qilang-project/qi-lang
#   /plugin install qilang@qilang
#
# 这个脚本是给 Codex 和其它工具用的，做的事就一件：
# 把 skills/ 下的每个目录**软链**到目标位置。软链而不是拷贝，这样
# `git pull` 一下技能就更新了，不用重装。
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
SRC="$HERE/skills"

# 目标目录：默认两个都试，装到存在的那个。也可以显式指定
#   ./install.sh ~/.codex/skills
targets=()
if [ $# -gt 0 ]; then
    targets=("$@")
else
    [ -d "$HOME/.codex" ] && targets+=("$HOME/.codex/skills")
    [ -d "$HOME/.claude" ] && targets+=("$HOME/.claude/skills")
fi

if [ ${#targets[@]} -eq 0 ]; then
    echo "没找到 ~/.codex 或 ~/.claude。显式给个目录：" >&2
    echo "  ./install.sh /路径/skills" >&2
    exit 1
fi

for dst in "${targets[@]}"; do
    mkdir -p "$dst"
    for d in "$SRC"/*/; do
        name="$(basename "$d")"
        # -n 让 ln 把已存在的软链当普通文件替换掉，而不是链到它里面去
        ln -sfn "${d%/}" "$dst/$name"
        echo "  $dst/$name → ${d%/}"
    done
done

echo
echo "装好了。验证：新开一个会话，问它「用 qi 写一个 HTTP 服务」，"
echo "它应该主动去读 qi-lang 和 qi-web 两个技能。"
echo "要更新：在这个仓库里 git pull（软链会自动跟上）。"
