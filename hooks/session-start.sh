#!/usr/bin/env bash
# SessionStart hook for autonome plugin

set -euo pipefail

# Determine plugin root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Check if legacy skills directory exists and build warning
warning_message=""
legacy_skills_dir="${HOME}/.config/autonome/skills"
if [ -d "$legacy_skills_dir" ]; then
    warning_message="\n\n<important-reminder>IN YOUR FIRST REPLY AFTER SEEING THIS MESSAGE YOU MUST TELL THE USER:⚠️ **WARNING:** Autonome now uses Claude Code's skills system. Custom skills in ~/.config/autonome/skills will not be read. Move custom skills to ~/.claude/skills instead. To make this message go away, remove ~/.config/autonome/skills</important-reminder>"
fi

# Read use-autonome content
using_autonome_content=$(cat "${PLUGIN_ROOT}/skills/use-autonome/SKILL.md" 2>&1 || echo "Error reading use-autonome skill")

# Escape outputs for JSON using pure bash
escape_for_json() {
    local input="$1"
    local output=""
    local i char
    for (( i=0; i<${#input}; i++ )); do
        char="${input:$i:1}"
        case "$char" in
            $'\\') output+='\\' ;;
            '"') output+='\"' ;;
            $'\n') output+='\n' ;;
            $'\r') output+='\r' ;;
            $'\t') output+='\t' ;;
            *) output+="$char" ;;
        esac
    done
    printf '%s' "$output"
}

using_autonome_escaped=$(escape_for_json "$using_autonome_content")
warning_escaped=$(escape_for_json "$warning_message")

# Output context injection as JSON
cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "<EXTREMELY_IMPORTANT>\nYou have enabled autonome mode.\n\n**Below is the full content of your 'autonome:use-autonome' skill - your introduction to using skills. For all other skills, use the 'Skill' tool:**\n\n${using_autonome_escaped}\n\n${warning_escaped}\n</EXTREMELY_IMPORTANT>"
  }
}
EOF

exit 0
