#!/usr/bin/env bash

# Quick verification script for use-architect skill

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DIR="$SCRIPT_DIR/../../skills/use-architect"

echo "======================================="
echo "  Testing use-architect Skill"
echo "======================================="
echo ""

# Test 1: Skill directory exists
echo "Test 1: Skill directory exists..."
if [ -d "$SKILL_DIR" ]; then
    echo "  [PASS] Directory exists: $SKILL_DIR"
else
    echo "  [FAIL] Directory not found: $SKILL_DIR"
    exit 1
fi
echo ""

# Test 2: SKILL.md exists
echo "Test 2: SKILL.md exists..."
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    echo "  [PASS] SKILL.md found"
else
    echo "  [FAIL] SKILL.md not found"
    exit 1
fi
echo ""

# Test 3: Frontmatter is valid YAML
echo "Test 3: Frontmatter format..."
if grep -q "^name: use-architect" "$SKILL_DIR/SKILL.md" && \
   grep -q "^description: Use" "$SKILL_DIR/SKILL.md"; then
    echo "  [PASS] Frontmatter has name and description"
else
    echo "  [FAIL] Frontmatter invalid"
    exit 1
fi
echo ""

# Test 4: Key sections exist
echo "Test 4: Key sections exist..."
REQUIRED_SECTIONS=(
    "When to Use"
    "The Process"
    "Core Principles"
    "Common Rationalizations"
    "Red Flags"
)

all_sections_found=true
for section in "${REQUIRED_SECTIONS[@]}"; do
    if grep -q "^# $section" "$SKILL_DIR/SKILL.md"; then
        echo "  [PASS] Found section: $section"
    else
        echo "  [FAIL] Missing section: $section"
        all_sections_found=false
    fi
done

if [ "$all_sections_found" = false ]; then
    exit 1
fi
echo ""

# Test 5: Pressure scenarios exist
echo "Test 5: Pressure scenarios exist..."
pressure_files=("$SCRIPT_DIR/pressure-scenarios/test-pressure-"{1..3}".md")
for file in "${pressure_files[@]}"; do
    if [ -f "$file" ]; then
        echo "  [PASS] Found: $(basename "$file")"
    else
        echo "  [FAIL] Missing: $(basename "$file")"
        exit 1
    fi
done
echo ""

# Test 6: ADR directory structure exists
echo "Test 6: ADR directory structure exists..."
# ADR is at ../../docs/arch/adr relative to SCRIPT_DIR
ADR_DIR="$SCRIPT_DIR/../../docs/arch/adr"
if [ -d "$ADR_DIR" ]; then
    echo "  [PASS] ADR directory exists"
else
    echo "  [FAIL] ADR directory not found at $ADR_DIR"
    exit 1
fi
echo ""

# Test 7: ADR template exists
echo "Test 7: ADR template exists..."
if [ -f "$SCRIPT_DIR/../../docs/arch/README.md" ]; then
    echo "  [PASS] ADR template exists"
else
    echo "  [FAIL] ADR template not found"
    exit 1
fi
echo ""

echo "======================================="
echo "  All Tests Passed!"
echo "======================================="
echo ""
echo "Skill is ready for manual testing and deployment."
echo ""
echo "To test manually:"
echo "  1. Start a Claude Code session"
echo "  2. Invoke: Use autonome:use-architect"
echo "  3. Try one of the pressure scenarios"
echo "  4. Verify the skill asks appropriate questions"
