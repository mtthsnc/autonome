#!/bin/bash
# Run all explicit skill request tests
# Usage: ./run-all.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPTS_DIR="$SCRIPT_DIR/prompts"

echo "=== Running All Explicit Skill Request Tests ==="
echo ""

PASSED=0
FAILED=0
RESULTS=""

# Test: use-subagents-dispatch, please
echo ">>> Test 1: please-use-subagents-dispatch"
if "$SCRIPT_DIR/run-test.sh" "use-subagents-dispatch" "$PROMPTS_DIR/please-use-subagents-dispatch.txt"; then
    PASSED=$((PASSED + 1))
    RESULTS="$RESULTS\nPASS: please-use-subagents-dispatch"
else
    FAILED=$((FAILED + 1))
    RESULTS="$RESULTS\nFAIL: please-use-subagents-dispatch"
fi
echo ""

# Test: use use-debug
echo ">>> Test 2: please-use-debug"
if "$SCRIPT_DIR/run-test.sh" "use-debug" "$PROMPTS_DIR/please-use-debug.txt"; then
    PASSED=$((PASSED + 1))
    RESULTS="$RESULTS\nPASS: please-use-debug"
else
    FAILED=$((FAILED + 1))
    RESULTS="$RESULTS\nFAIL: please-use-debug"
fi
echo ""

# Test: please use brainstorm
echo ">>> Test 3: please-use-brainstorm"
if "$SCRIPT_DIR/run-test.sh" "brainstorm" "$PROMPTS_DIR/please-use-brainstorm.txt"; then
    PASSED=$((PASSED + 1))
    RESULTS="$RESULTS\nPASS: please-use-brainstorm"
else
    FAILED=$((FAILED + 1))
    RESULTS="$RESULTS\nFAIL: please-use-brainstorm"
fi
echo ""

# Test: mid-conversation execute plan
echo ">>> Test 4: mid-conversation-plan-execute"
if "$SCRIPT_DIR/run-test.sh" "use-subagents-dispatch" "$PROMPTS_DIR/mid-conversation-plan-execute.txt"; then
    PASSED=$((PASSED + 1))
    RESULTS="$RESULTS\nPASS: mid-conversation-plan-execute"
else
    FAILED=$((FAILED + 1))
    RESULTS="$RESULTS\nFAIL: mid-conversation-plan-execute"
fi
echo ""

echo "=== Summary ==="
echo -e "$RESULTS"
echo ""
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "Total: $((PASSED + FAILED))"

if [ "$FAILED" -gt 0 ]; then
    exit 1
fi
