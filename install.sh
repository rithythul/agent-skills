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
  echo "NOTE: Not inside a GitHub repo — skipping label creation. Run install.sh from your project directory to create labels."
fi

# Install skills
mkdir -p "$SKILLS_DIR"
for skill in grill-me to-prd to-issues implement; do
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

echo ""
echo "NOTE: Uses your current gh token. Recommend a repo-scoped token for implement:"
echo "      gh auth refresh --scopes repo"
echo ""
echo "Done. Restart Claude Code to load the skills."
echo "Pipeline: grill-me → to-prd → to-issues → implement"
