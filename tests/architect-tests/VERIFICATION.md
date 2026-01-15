# Skill Verification Checklist

## Format Verification ✅

- [x] Frontmatter is correct YAML format
- [x] `name` uses only letters, numbers, hyphens: `use-architect`
- [x] `description` starts with "Use..." format
- [x] `description` describes ONLY triggering conditions (not workflow)
- [x] `description` under 500 characters
- [x] Body has clear sections with proper headers
- [x] Has "Core principle" statement
- [x] Has "When to Use" and "When NOT to use"
- [x] Has "The Process" with numbered steps
- [x] Has "Core Principles" bullets
- [x] Has "Common Rationalizations" table
- [x] Has "Red Flags" section
- [x] References related skills

## Content Verification ✅

- [x] Addresses baseline rationalizations from RED phase:
  - [x] Time pressure counter: "Architecture review takes 15-30 min, catches $1000 bugs at $10 cost"
  - [x] Simple feature counter: "Simple features have architectural choices"
  - [x] Experience pattern counter: "Experience ≠ appropriate for THIS context"
  - [x] Later refactor counter: "Refactor costs 10x more"
  - [x] YAGNI counter: "YAGNI means simple architecture, not NO architecture"
  - [x] Authority counter: "Authority ≠ correct architecture"
- [x] Domain detection logic included
- [x] Universal architectural questions (entities, boundaries, dependencies, data flow, testability)
- [x] Domain-specific questions for frontend, backend, and fullstack
- [x] ADR template and documentation
- [x] Integration points with other skills (brainstorm → architect → plan-create)

## Alignment with Existing Skills ✅

- [x] Follows guidance-oriented pattern (like use-brainstorm, use-plan-create)
- [x] One question at a time principle
- [x] Multiple choice preferred
- [x] Concise and direct (no fluff)
- [x] Clear process sections
- [x] Handoff to next skill (use-plan-create)

## Testability ✅

- [x] Pressure scenarios created (3 scenarios)
- [x] Integration test specification created
- [x] RED phase baseline documented
- [x] ADR directory structure created
- [x] ADR template created
- [x] Sample ADR provided

## Workflow Integration ✅

- [x] Fits between `use-brainstorm` and `use-plan-create`
- [x] Clear triggering conditions
- [x] Clear handoff to next step
- [x] Doesn't duplicate other skills
- [x] References related skills correctly

## Files Created ✅

- [x] `/skills/use-architect/SKILL.md` - Main skill file
- [x] `/skills/use-architect/test-pressure-1.md` - Pressure scenario 1
- [x] `/skills/use-architect/test-pressure-2.md` - Pressure scenario 2
- [x] `/skills/use-architect/test-pressure-3.md` - Pressure scenario 3
- [x] `/skills/use-architect/test-integration.md` - Integration test spec
- [x] `/skills/use-architect/RED-PHASE.md` - Baseline behavior documentation
- [x] `/docs/arch/adr/` - ADR directory
- [x] `/docs/arch/README.md` - ADR template
- [x] `/docs/arch/adr/2025-01-15-example-jwt-auth.md` - Sample ADR

## Ready for Deployment

All checklist items complete. The skill is ready for:
1. Manual testing with real scenarios
2. Integration testing if needed
3. Git commit and deployment
