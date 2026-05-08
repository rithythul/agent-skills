#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_MODE=false

# Parse flags
for arg in "$@"; do
  case $arg in
    --project) PROJECT_MODE=true ;;
    --help|-h)
      echo "Usage: ./install.sh [--project]"
      echo ""
      echo "  (no flag)   Install globally into ~/.claude/skills/  (all projects)"
      echo "  --project   Install into .claude/skills/ in current directory (this project only)"
      exit 0
      ;;
  esac
done

if $PROJECT_MODE; then
  SKILLS_DIR="$(pwd)/.claude/skills"
  echo "KOOMPI Agent Skills — project install ($(pwd))"
else
  SKILLS_DIR="$HOME/.claude/skills"
  echo "KOOMPI Agent Skills — global install (~/.claude/skills/)"
fi
echo ""

# Check gh auth
if ! gh auth status &>/dev/null; then
  echo "ERROR: gh CLI not authenticated. Run: gh auth login"
  exit 1
fi
echo "✓ gh authenticated"

# Check ralph-loop
if ! find "$HOME/.claude/plugins/cache" -name "ralph-loop" -type d 2>/dev/null | grep -q ralph; then
  echo ""
  echo "WARNING: ralph-loop plugin not found in ~/.claude/plugins/cache/"
  echo "Install it via: /plugins install ralph-loop@claude-plugins-official"
  echo "(The implement skill will not work without it)"
  echo ""
fi

# Create required labels in current repo
if gh repo view &>/dev/null 2>&1; then
  echo "Creating labels in $(gh repo view --json nameWithOwner -q .nameWithOwner)..."
  for label_name in "needs-triage" "ready" "in-progress"; do
    if ! gh label list --json name -q '.[].name' | grep -qx "$label_name"; then
      case "$label_name" in
        "needs-triage") COLOR="#ededed"; DESC="Needs triage review" ;;
        "ready")        COLOR="#0075ca"; DESC="Ready to implement" ;;
        "in-progress")  COLOR="#e4e669"; DESC="Currently being implemented" ;;
      esac
      gh label create "$label_name" --color "$COLOR" --description "$DESC"
      echo "✓ Created label: $label_name"
    else
      echo "✓ Label exists: $label_name (skipped)"
    fi
  done
else
  echo "NOTE: Not inside a GitHub repo — skipping label creation."
  echo "      Run install.sh from your project directory to create labels."
fi

# Install skills
mkdir -p "$SKILLS_DIR"
for skill in grill-me to-prd to-issues triage implement; do
  target="$SKILLS_DIR/$skill"
  expected="$REPO_DIR/skills/$skill"
  if [ -L "$target" ]; then
    current=$(readlink "$target")
    if [ "$current" = "$expected" ]; then
      echo "✓ Already linked: $skill"
      continue
    fi
    echo "Replacing existing symlink for $skill (was: $current)"
    rm "$target"
  elif [ -e "$target" ]; then
    echo "WARNING: $target exists and is not a symlink — skipping $skill. Remove manually to install."
    continue
  fi
  ln -s "$expected" "$target"
  echo "✓ Linked $skill"
done


# Append directives to ~/.claude/CLAUDE.md (idempotent)
GLOBAL_CLAUDE="$HOME/.claude/CLAUDE.md"
INCLUDE_LINE="@include $REPO_DIR/directives.md"
FENCE="# === agent-skills directives ==="

if grep -qF "$FENCE" "$GLOBAL_CLAUDE" 2>/dev/null; then
  echo "✓ Directives already in $GLOBAL_CLAUDE (skipped)"
elif grep -qF "$INCLUDE_LINE" "$GLOBAL_CLAUDE" 2>/dev/null; then
  echo "✓ Directives already in $GLOBAL_CLAUDE (skipped)"
else
  echo "" >> "$GLOBAL_CLAUDE"
  echo "$FENCE" >> "$GLOBAL_CLAUDE"
  echo "$INCLUDE_LINE" >> "$GLOBAL_CLAUDE"
  echo "✓ Added directives to $GLOBAL_CLAUDE"
  echo "  → $INCLUDE_LINE"
fi

echo ""
echo "NOTE: Uses your current gh token. Recommend a repo-scoped token for implement:"
echo "      gh auth refresh --scopes repo"
echo ""
echo "Done. Restart Claude Code to load the skills."
echo "Pipeline: grill-me → to-prd → to-issues → triage → implement"
echo "Token mode: prefix any message with !c to compress output (~75% fewer tokens)"
