#!/usr/bin/env bash
set -eu

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGENTS="all"
DRY_RUN=0
FORCE=0

usage() {
  cat <<'EOF'
Usage: scripts/sync-skills.sh [--agents agents,codex,claude,zcode,kimi,both,all] [--dry-run] [--force]

Defaults:
  agents -> ~/.agents/skills
  codex  -> ~/.codex/skills
  claude -> ~/.claude/skills
  zcode  -> ~/.zcode/skills
  kimi   -> ~/gstack/.kimi/skills

Override targets:
  AGENTS_SKILLS_DIR=/path/to/skills
  CODEX_SKILLS_DIR=/path/to/skills
  CLAUDE_SKILLS_DIR=/path/to/skills
  ZCODE_SKILLS_DIR=/path/to/skills
  KIMI_SKILLS_DIR=/path/to/skills
EOF
}

target_dir() {
  case "$1" in
    agents) printf '%s\n' "${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}" ;;
    codex) printf '%s\n' "${CODEX_SKILLS_DIR:-$HOME/.codex/skills}" ;;
    claude) printf '%s\n' "${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}" ;;
    zcode) printf '%s\n' "${ZCODE_SKILLS_DIR:-$HOME/.zcode/skills}" ;;
    kimi) printf '%s\n' "${KIMI_SKILLS_DIR:-$HOME/gstack/.kimi/skills}" ;;
    *) printf 'Unknown agent: %s\n' "$1" >&2; exit 2 ;;
  esac
}

append_agent() {
  case " $TARGET_AGENTS " in
    *" $1 "*) ;;
    *) TARGET_AGENTS="${TARGET_AGENTS:+$TARGET_AGENTS }$1" ;;
  esac
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --agents)
      AGENTS="${2:-}"
      [ -n "$AGENTS" ] || { printf '%s\n' "--agents needs a value" >&2; exit 2; }
      shift 2
      ;;
    --agents=*)
      AGENTS="${1#--agents=}"
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown option: %s\n' "$1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

TARGET_AGENTS=""
for agent in $(printf '%s' "$AGENTS" | tr ',' ' '); do
  case "$agent" in
    all)
      append_agent agents
      append_agent codex
      append_agent claude
      append_agent zcode
      append_agent kimi
      ;;
    both)
      append_agent codex
      append_agent claude
      ;;
    agents|codex|claude|zcode|kimi)
      append_agent "$agent"
      ;;
    "")
      printf '%s\n' "Empty agent name in --agents" >&2
      exit 2
      ;;
    *)
      printf 'Unknown agent: %s\n' "$agent" >&2
      exit 2
      ;;
  esac
done

for agent in $TARGET_AGENTS; do
  target="$(target_dir "$agent")"
  printf '%s\n' "==> $agent -> $target"

  for src in "$ROOT"/skills/*; do
    [ -d "$src" ] || continue
    name="$(basename "$src")"
    dst="$target/$name"

    if [ -e "$dst" ] && [ ! -e "$dst/.wen-pm-managed" ] && [ "$FORCE" -ne 1 ]; then
      if [ "$DRY_RUN" -eq 1 ]; then
        printf '%s\n' "would refuse $dst; pass --force to take ownership"
        continue
      fi
      printf '%s\n' "refusing $dst; pass --force to take ownership" >&2
      exit 1
    fi

    if [ "$DRY_RUN" -eq 1 ]; then
      printf '%s\n' "would sync $name"
      continue
    fi

    mkdir -p "$target"
    rm -rf "$dst"
    cp -R "$src" "$dst"
    touch "$dst/.wen-pm-managed"
    printf '%s\n' "synced $name"
  done
done
