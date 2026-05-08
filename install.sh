#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "KOOMPI Agent Skills — installer"
echo ""

# Check gh auth
if ! gh auth status &>/dev/null; then
  echo "ERROR: gh CLI not authenticated. Run: gh auth login"
  exit 1
fi
echo "✓ gh authenticated"

# Check ralph-loop
if ! find "$HOME/.claude/plugins/cache" -name "ralph-loop" -type d &>/dev/null | grep -q ralph; then
  echo ""
  echo "WARNING: ralph-loop plugin not found in ~/.claude/plugins/cache/"
  echo "Install it via: /plugins install ralph-loop@claude-plugins-official"
  echo "(The implement skill will not work without it)"
  echo ""
fi

# Create required labels in current repo
if gh repo view &>/dev/null 2>&1; then
  echo "Creating labels in $(gh repo view --json nameWithOwner -q .nameWithOwner)..."
  gh label create "needs-triage" --color "#ededed" --description "Needs triage review" --force
  gh label create "ready"        --color "#0075ca" --description "Ready to implement"  --force
  gh label create "in-progress"  --color "#e4e669" --description "Currently being implemented" --force
  echo "✓ Labels created"
else
  echo "NOTE: Not inside a GitHub repo — skipping label creation. Run install.sh from your project directory to create labels."
fi

# Install skills
mkdir -p "$SKILLS_DIR"
for skill in grill-me to-prd to-issues implement; do
  target="$SKILLS_DIR/$skill"
  if [ -L "$target" ]; then
    rm "$target"
  fi
  ln -s "$REPO_DIR/skills/$skill" "$target"
  echo "✓ Linked $skill"
done

echo ""
echo "Done. Restart Claude Code to load the skills."
echo "Pipeline: grill-me → to-prd → to-issues → implement"
