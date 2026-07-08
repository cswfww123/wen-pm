#!/usr/bin/env bash
set -eu

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGENTS="codex,claude"
DRY_RUN=0
FORCE=0

usage() {
  cat <<'EOF'
Usage: scripts/sync-skills.sh [--agents codex,claude] [--dry-run] [--force]

Defaults:
  codex  -> ~/.agents/skills
  claude -> ~/.claude/skills

Override targets:
  WEN_PM_CODEX_SKILLS_DIR=/path/to/skills
  WEN_PM_CLAUDE_SKILLS_DIR=/path/to/skills
EOF
}

target_dir() {
  case "$1" in
    codex) printf '%s\n' "${WEN_PM_CODEX_SKILLS_DIR:-$HOME/.agents/skills}" ;;
    claude) printf '%s\n' "${WEN_PM_CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}" ;;
    *) printf 'Unknown agent: %s\n' "$1" >&2; exit 2 ;;
  esac
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --agents)
      AGENTS="${2:-}"
      [ -n "$AGENTS" ] || { printf '%s\n' "--agents needs a value" >&2; exit 2; }
      shift 2
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

for agent in $(printf '%s' "$AGENTS" | tr ',' ' '); do
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
