# Architect Skill - Complete Implementation

## What Was Built

Following TDD for skill creation, we've created the `use-architect` skill with full testability:

### Core Skill: `autonome:use-architect`

A guidance-oriented skill that helps validate architectural decisions between brainstorm and implementation planning.

**Position in workflow:**
```
use-brainstorm → use-architect → use-plan-create → implementation
   (design)      (validate)      (detailed plan)
```

**Key Features:**
1. **Domain detection** - Automatically identifies frontend/backend/fullstack
2. **Universal architectural review** - Entities, boundaries, dependencies, data flow, testability
3. **Domain-specific questions** - Tailored to frontend, backend, or fullstack concerns
4. **ADR support** - Architecture Decision Records with template
5. **Integration** - Clean handoff to implementation planning

### Testability Strategy

Following `autonome:use-skill-create`, we used TDD:

**RED Phase:**
- Created 3 pressure scenarios identifying where agents skip architecture
- Documented baseline rationalizations (time pressure, "it's simple", "later", authority)
- Identified what gets missed without the skill

**GREEN Phase:**
- Wrote skill addressing each rationalization explicitly
- Added counters to "later is cheaper", "YAGNI means no architecture", etc.
- Made skill concise and practical (not overbearing)

**REFACTOR Phase:**
- Verification checklist confirms all rationalizations addressed
- Test script validates skill structure and files
- Ready for manual testing with real scenarios

### Files Created

```
skills/use-architect/
└── SKILL.md                           # Main skill file

tests/architect-tests/
├── README.md                          # This file (implementation summary)
├── pressure-scenarios/               # RED Phase: Pressure scenarios
│   ├── test-pressure-1.md            # Urgent feature scenario
│   ├── test-pressure-2.md            # "I know this pattern" scenario
│   └── test-pressure-3.md            # Many small features scenario
├── test-integration.md               # Integration test specification
├── RED-PHASE.md                       # Baseline behavior documentation
├── VERIFICATION.md                    # Verification checklist
└── test-quick-verify.sh               # Automated verification script

docs/arch/
├── README.md                          # ADR template and guide
└── adr/
    └── 2025-01-15-example-jwt-auth.md # Sample ADR
```

## How to Use

### In Your Development Workflow

**When to invoke:**
- After completing a design phase (brainstorm, requirements gathering)
- Before creating detailed implementation plans
- When making significant architectural changes

**Example workflow:**

```bash
# 1. Brainstorm the design
"I want to add user authentication with JWT tokens. Let me use the brainstorm skill."
→ Design document created: docs/plans/2025-01-15-user-auth-design.md

# 2. Validate architecture
"Now let me validate the architecture with the architect skill."
→ Domain detected: Fullstack
→ Architectural questions asked about security, session management, API boundaries
→ ADR created: docs/arch/adr/2025-01-15-jwt-auth-architecture.md

# 3. Create implementation plan
"Architecture looks good. Let me create the implementation plan."
→ Implementation plan created with detailed steps
```

### Manual Testing

To test the skill manually:

```bash
#1. Run verification
cd tests/architect-tests
./test-quick-verify.sh

# 2. Start a Claude Code session
# 3. Invoke skill
"Use autonome:use-architect"

# 4. Try a scenario
Read one of the pressure scenarios (pressure-scenarios/test-pressure-*.md) and see if the skill helps you make better decisions
```

### Using with Pressure Scenarios

The pressure scenarios (`test-pressure-1.md` to `test-pressure-3.md`) can be used to:

1. **Train yourself** - Practice making architectural decisions under pressure
2. **Test the skill** - Verify the skill counters the rationalizations
3. **Onboard team members** - Show common pitfalls and how to avoid them

## Key Design Decisions

### Why Guidance-Oriented, Not Strict?

Architecture is contextual - there's rarely one "right" answer. The skill guides thinking rather than enforcing rules, similar to `use-brainstorm` and `use-plan-create`.

### Why Domain Detection?

Frontend, backend, and fullstack have different architectural concerns. Automatic detection tailors questions to be relevant, making the skill more efficient.

### Why ADRs?

Architecture decisions need rationale. ADRs capture the "why" behind decisions, making them reviewable and allowing future re-evaluation.

### Why Between Brainstorm and Plan?

This is the ideal point: design is complete but implementation hasn't started. Architecture is cheap to change now, expensive after code is written.

## Testing the Skill

### Automated Tests

```bash
# Quick verification
./skills/use-architect/test-quick-verify.sh

# All tests pass ✅
```

### Manual Tests

**Test 1: Frontend Feature**
1. Describe: "Build a todo list app with React, add/edit/delete todos, persist to localStorage"
2. Invoke skill
3. Verify: Detects frontend, asks about state management, component hierarchy, data flow

**Test 2: Backend API**
1. Describe: "Build a user management API with CRUD operations and authentication"
2. Invoke skill
3. Verify: Detects backend, asks about API design, database schema, service boundaries

**Test 3: Fullstack Feature**
1. Describe: "Build a blog platform with frontend UI, backend API, and database"
2. Invoke skill
3. Verify: Detects fullstack, asks about API contracts, deployment boundaries, shared types

## Next Steps

1. **Try it out** - Use the skill on a real feature you're building
2. **Refine based on use** - If you find new rationalizations, add them to the Common Rationalizations table
3. **Create ADRs** - Document significant architectural decisions for your projects
4. **Share with team** - Onboard team members to use the skill consistently

## Commit and Deploy

The skill is ready to commit:

```bash
git add skills/use-architect/
git add tests/architect-tests/
git add docs/arch/
git commit -m "feat: add use-architect skill for architectural validation"
```

All verification tests pass and the skill aligns with the existing skill structure.
