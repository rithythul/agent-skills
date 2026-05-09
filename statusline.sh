#!/usr/bin/env bash
# Claude Code statusLine
# Layout: ➜ repo:branch✗ │ Model vX.Y.Z │ 3m12s │ ctx:130k/1M 13% │ +12/-3

input=$(cat)

# ── Colors ─────────────────────────────────────────────────────────────
C_ARROW=$'\033[1;32m'      # bright green
C_REPO=$'\033[1;36m'       # bright cyan
C_BRANCH=$'\033[0;31m'     # red
C_GIT=$'\033[1;34m'        # blue
C_DIRTY=$'\033[1;33m'      # yellow
C_MODEL=$'\033[1;35m'      # magenta
C_VERSION=$'\033[2;37m'    # dim white
C_TIME=$'\033[0;36m'       # cyan
C_CTX_OK=$'\033[2;37m'     # dim
C_CTX_WARN=$'\033[1;33m'   # yellow (>50%)
C_CTX_HOT=$'\033[1;31m'    # red (≥65% — auto-compact)
C_ADD=$'\033[0;32m'        # green
C_DEL=$'\033[0;31m'        # red
C_SEP=$'\033[2;90m'        # gray dim
C_EFFORT_LOW=$'\033[2;37m'   # dim
C_EFFORT_HI=$'\033[1;33m'    # yellow (high)
C_EFFORT_MAX=$'\033[1;31m'   # red (xhigh/max)
C_THINK=$'\033[1;95m'        # bright pink/magenta
C_VIM=$'\033[1;35m'        # magenta
C_RL=$'\033[1;31m'         # red
C_RST=$'\033[0m'

SEP="${C_SEP} │ ${C_RST}"

# ── Working dir / repo / branch ────────────────────────────────────────
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
repo_root=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" rev-parse --show-toplevel 2>/dev/null)
if [ -n "$repo_root" ]; then
  repo=$(basename "$repo_root")
  branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null \
    || GIT_OPTIONAL_LOCKS=0 git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  dirty=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" status --porcelain 2>/dev/null)
  loc_part="${C_REPO}${repo}${C_RST}${C_GIT}:${C_RST}${C_BRANCH}${branch}${C_RST}"
  [ -n "$dirty" ] && loc_part="${loc_part}${C_DIRTY}✗${C_RST}"
else
  loc_part="${C_REPO}$(basename "$cwd")${C_RST}"
fi

# ── Model + Claude Code version ────────────────────────────────────────
model=$(echo "$input" | jq -r '.model.display_name // .model.id // "?"' | sed 's/ context)/ ctx)/')
ccver=$(echo "$input" | jq -r '.version // empty')
model_part="${C_MODEL}${model}${C_RST}"
[ -n "$ccver" ] && model_part="${model_part} ${C_VERSION}v${ccver}${C_RST}"

# ── Session duration ───────────────────────────────────────────────────
dur_ms=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')
fmt_dur() {
  local ms=$1 s m h
  s=$(( ms / 1000 ))
  if [ "$s" -lt 60 ]; then echo "${s}s"
  elif [ "$s" -lt 3600 ]; then m=$((s/60)); s=$((s%60)); echo "${m}m${s}s"
  else h=$((s/3600)); m=$(((s%3600)/60)); echo "${h}h${m}m"
  fi
}
dur_part=""
if [ "$dur_ms" -gt 0 ] 2>/dev/null; then
  dur_part="${C_TIME}$(fmt_dur "$dur_ms")${C_RST}"
fi

# ── Context window ─────────────────────────────────────────────────────
IFS='|' read -r ctx_text ctx_pct < <(echo "$input" | jq -r '
  (.context_window.total_input_tokens // 0) as $u |
  (.context_window.context_window_size // 0) as $t |
  if $t > 0 then
    ($u * 100 / $t) as $p |
    (if $u >= 1000000 then "\($u/1000000*10|floor/10)M"
     elif $u >= 1000 then "\($u/1000|floor)k"
     else "\($u)" end) as $us |
    (if $t >= 1000000 then "\($t/1000000|floor)M"
     elif $t >= 1000 then "\($t/1000|floor)k"
     else "\($t)" end) as $ts |
    "ctx:\($us)/\($ts) \($p|floor)%|\($p|floor)"
  else "|" end
')
ctx_part=""
if [ -n "$ctx_text" ]; then
  if [ "${ctx_pct:-0}" -ge 65 ]; then
    ctx_part="${C_CTX_HOT}${ctx_text}${C_RST}"
  elif [ "${ctx_pct:-0}" -ge 50 ]; then
    ctx_part="${C_CTX_WARN}${ctx_text}${C_RST}"
  else
    ctx_part="${C_CTX_OK}${ctx_text}${C_RST}"
  fi
fi

# ── Lines added/removed (only if non-zero) ─────────────────────────────
adds=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
dels=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')
diff_part=""
if [ "$adds" -gt 0 ] || [ "$dels" -gt 0 ] 2>/dev/null; then
  diff_part="${C_ADD}+${adds}${C_RST}/${C_DEL}-${dels}${C_RST}"
fi

# ── Optional indicators ────────────────────────────────────────────────
extras=""

vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')
if [ -n "$vim_mode" ] && [ "$vim_mode" != "INSERT" ]; then
  extras="${extras}${SEP}${C_VIM}${vim_mode}${C_RST}"
fi

effort=$(echo "$input" | jq -r '.effort.level // empty')
if [ -n "$effort" ] && [ "$effort" != "medium" ]; then
  case "$effort" in
    xhigh|max) ec=$C_EFFORT_MAX ;;
    high)      ec=$C_EFFORT_HI ;;
    *)         ec=$C_EFFORT_LOW ;;
  esac
  extras="${extras}${SEP}${ec}⚡${effort}${C_RST}"
fi

thinking=$(echo "$input" | jq -r '.thinking.enabled // false')
[ "$thinking" = "true" ] && extras="${extras}${SEP}${C_THINK}🧠think${C_RST}"

rl_5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // 0 | floor')
if [ "$rl_5h" -ge 75 ] 2>/dev/null; then
  extras="${extras}${SEP}${C_RL}5h:${rl_5h}%${C_RST}"
fi

# ── Compose ────────────────────────────────────────────────────────────
out="${C_ARROW}➜${C_RST} ${loc_part}${SEP}${model_part}"
[ -n "$dur_part" ] && out="${out}${SEP}${dur_part}"
[ -n "$ctx_part" ] && out="${out}${SEP}${ctx_part}"
[ -n "$diff_part" ] && out="${out}${SEP}${diff_part}"
out="${out}${extras}"

printf "%s" "$out"
