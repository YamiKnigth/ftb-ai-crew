#!/usr/bin/env bash
# Install ftb-ai-crew Cursor skills + knowledge into the current (or target) repo.
#
# One-liner from another repo:
#   curl -fsSL https://raw.githubusercontent.com/YamiKnigth/ftb-ai-crew/main/install.sh | bash
#
set -euo pipefail

TARGET="${1:-$(pwd)}"
REPO_URL="${FTB_AI_CREW_REPO:-https://github.com/YamiKnigth/ftb-ai-crew.git}"
REF="${FTB_AI_CREW_REF:-main}"

TMP="$(mktemp -d)"
cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

echo "Cloning $REPO_URL ($REF) ..."
git clone --depth 1 --branch "$REF" "$REPO_URL" "$TMP"

echo "Installing into: $TARGET"
mkdir -p "$TARGET/.cursor/skills" "$TARGET/.cursor/rules" \
  "$TARGET/resources/knowledge" "$TARGET/resources/docs" "$TARGET/plans"

cp -R "$TMP/.cursor/skills/." "$TARGET/.cursor/skills/"
cp -R "$TMP/.cursor/rules/." "$TARGET/.cursor/rules/"
cp -R "$TMP/resources/knowledge/." "$TARGET/resources/knowledge/"
cp -R "$TMP/resources/docs/." "$TARGET/resources/docs/"
cp "$TMP/AGENTS.md" "$TARGET/AGENTS.ftb-ai-crew.md"
touch "$TARGET/plans/.gitkeep"

cat > "$TARGET/FTB-AI-CREW.md" <<EOF
# FTB AI Crew (installed)

Skills installed from: $REPO_URL ($REF)

- Skills: \`.cursor/skills/ftb-quest-crew\`, \`ftb-quest-format\`, \`ftb-server-suite\`
- Knowledge: \`resources/knowledge/questcraft/\`, \`resources/docs/\`
- Plans output: \`plans/\`
- Crew notes: \`AGENTS.ftb-ai-crew.md\`

In Cursor, ask e.g. "Usa ftb-quest-crew: analiza este modpack y recomienda mods para misiones".
EOF

echo "Done. Installed into $TARGET"