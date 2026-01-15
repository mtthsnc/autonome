# RED Phase: Baseline Behavior Documentation

This document captures what agents/subagents do WITHOUT the architect skill, identifying rationalizations that lead to skipping or inadequate architecture review.

## Pressure Scenario 1: Urgent Feature Request

**Expected baseline behavior WITHOUT skill:**
- Subagent chooses Option A or C (skip architecture)
- Rationalizations:
  - "Time pressure means architecture can wait"
  - "It's simple enough to not need review"
  - "CEO priority means deliver now, think later"
  - "Security can be improved later" (classic "later" trap)
- Directly implements authentication using localStorage + JWT
- May copy-paste auth code from tutorials without understanding trade-offs
- Likely missing: refresh tokens, proper session management, security best practices
- Result: Quick but insecure implementation, technical debt

**What this reveals:**
- Time pressure + simple description = skip architecture
- "Later" rationalization leads to never fixing it
- External pressure (CEO/PM) trumps process

## Pressure Scenario 2: "I Already Know This Pattern"

**Expected baseline behavior WITHOUT skill:**
- Subagent chooses Option A or C (accept template without review)
- Rationalizations:
  - "I've done this before, I know the pattern"
  - "Template worked before, must work here"
  - "Time efficiency over process"
  - "Teammate approval means it's good"
- Copy-pastes the dashboard template
- Adapts it without questioning if Redux is needed
- Doesn't consider if Chart.js is optimal for THIS data
- Result: Over-engineered solution (Redux for simple state), wrong tool choice

**What this reveals:**
- Experience can lead to assumptions
- Copy-paste efficiency overrides thinking
- "Proven pattern" ≠ appropriate pattern
- Team authority leads to less questioning

## Pressure Scenario 3: Many Small Features

**Expected baseline behavior WITHOUT skill:**
- Subagent chooses Option A or C (build features without architecture)
- Rationalizations:
  - "YAGNI - build architecture only when needed"
  - "Small CRUD doesn't need architecture"
  - "Refactor later when it becomes a problem"
  - "Lead says no over-engineering"
- Builds 20 features as independent CRUD
- Code accumulates in same places, boundaries blur
- Duplicates similar logic across features
- Result: Bad architecture compounded by 20 features, harder to refactor later

**What this reveals:**
- "YAGNI" misused to justify no architecture
- Many small features = architectural complexity ignored
- "Later" refactor is exponentially harder than fixing now
- Authority pressure overrides good judgment

## Common Patterns Across Scenarios

**Rationalizations:**
1. "Time pressure" - architecture takes too long
2. "It's simple" - simple features don't need review
3. "I know this" - experience/existing pattern suffices
4. "Later" - can fix/refactor/improve later
5. "Authority" - stakeholders/leads say skip it
6. "YAGNI" - build only what's needed now

**What agents skip:**
1. Domain detection (frontend vs backend vs fullstack)
2. Universal architectural questions (boundaries, dependencies, data flow, testability)
3. Domain-specific questions (state management, API design, service boundaries)
4. Identifying architectural risks or issues
5. Documenting decisions with rationale

**Resulting problems:**
- Inappropriate tech stack choices
- Missing architecture layers (no error handling, no service boundaries)
- Tight coupling and poor separation of concerns
- Security vulnerabilities
- Technical debt that compounds
- Hard-to-maintain code

## What the Skill Must Counter

The skill must:
1. Make architecture review feel efficient (not time-consuming)
2. Demonstrate that "simple" features have architectural considerations
3. Question assumptions from experience/templates
4. Address "later" rationalization with "later is exponentially harder"
5. Recognize that authority ≠ correct architectural decision
6. Clarify that YAGNI ≠ no architecture (simple architecture is still architecture)

## Skill Strategy

Based on these baselines, the skill should:
- Emphasize that good architecture catches issues CHEAPEST when done early
- Frame architecture review as "smart investment" not "time waste"
- Ask questions one at a time (don't overwhelm)
- Use multiple choice when possible (make it easy to answer)
- Be brief and focused (target <200 words for core process)
- Produce concrete outputs (ADRs, decisions documented)
