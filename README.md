![autonome-banner](https://github.com/user-attachments/assets/6ac76ef7-41f9-4d13-ae30-4b5fb1021a06)

## What is Autonome?

Autonome is a set of structured workflows that help AI coding agents build software more reliably. Instead of jumping straight into coding, it guides the agent through design, planning, and review stages.

Think of it as guardrails that keep AI agents aligned with your intent.

## What problems does this solve?

- AI agents that start coding before understanding requirements
- Context overflow in long coding sessions
- Code that drifts from original intent
- Difficulty reviewing AI-generated changes
- Wasted effort on the wrong solution

## Who is this for?

- Developers using AI coding agents who want more reliable outputs
- Teams who need maintainable code from AI assistants
- Anyone frustrated by AI agents that drift from requirements

## Quick Start

1. Install the plugin for your platform (see Installation below)
2. Start a conversation with your AI coding agent about what you want to build
3. The workflow activates automatically

### What it looks like

**Before Autonome:**
- You: "Add user authentication"
- Agent: Writes 500 lines of code, then you realize it's the wrong approach

**With Autonome:**
- You: "Add user authentication"
- Agent: "Should we use JWT, session cookies, or OAuth? What users need access? Should it support password reset?"
- You approve the design
- Agent: Creates a detailed plan with testable steps
- Agent: Executes each step with automatic quality reviews

## Benefits

- Catch misunderstandings before code is written
- Work on multiple features in parallel without interference
- Resume work across different sessions without losing context
- Automatic quality reviews on every change
- Each task is small enough to understand and verify

## How it works

**Design first:**
The agent clarifies what you want before writing any code. It asks questions, explores alternatives, and gets your approval on a concrete specification.

**Plan next:**
The agent breaks your idea into small testable steps. Each step takes 2-5 minutes, includes exact code snippets, and verifies success with tests.

**Build automatically:**
Fresh agents execute each step with automatic reviews. No accumulated context means no confusion. Two-stage reviews check that the right problem was solved and that the code is high quality.

## Restaurant Analogy

Think of it like ordering at a restaurant:

**Intent Extraction** = The waiter asks clarifying questions about your order (allergies? spicy level? substitutions?) instead of guessing.

**Isolated Workspace** = Each order gets its own prep station ticket—no mixing up table 4's pasta with table 7's salad.

**Implementation Planning** = The chef breaks the meal into prep steps: chop vegetables, simmer sauce, grill meat, plate presentation.

**Execution** = Line cooks work their stations. Fresh cooks start each dish without confusion from previous orders.

**Quality Gates** = The expeditor checks each plate: "Is this what table 4 ordered?" then "Does it meet our presentation standards?"

**Completion & Cleanup** = The dish is served, your order is closed, and the prep station is cleared for the next customer.

Without this process: the waiter guesses your order, the kitchen mixes tickets, cooks are confused by previous orders, and you get the wrong meal. With Autonome: you get exactly what you asked for, every time.

## Installation

### Claude Code (via Plugin Marketplace)

Register the marketplace first:

```bash
/plugin marketplace add mtthsnc/autonome
```

Then install the plugin:

```bash
/plugin install autonome@autonome
```

Verify installation:

```bash
/help
```

You should see these commands:
- `/autonome:brainstorm` - Interactive design refinement
- `/autonome:plan-create` - Create implementation plan
- `/autonome:plan-execute` - Execute plan in batches

### Codex

Tell Codex:

```
Fetch and follow instructions from https://raw.githubusercontent.com/mtthsnc/autonome/refs/heads/main/.codex/INSTALL.md
```

**Detailed docs:** [docs/README.codex.md](docs/README.codex.md)

### OpenCode

Tell OpenCode:

```
Fetch and follow instructions from https://raw.githubusercontent.com/mtthsnc/autonome/refs/heads/main/.opencode/INSTALL.md
```

**Detailed docs:** [docs/README.opencode.md](docs/README.opencode.md)

## Skills Library

Autonome includes skills that activate automatically based on what you are doing.

**Testing**
- `use-tdd` - RED-GREEN-REFACTOR cycle with anti-patterns reference

**Debugging**
- `use-debug` - 4-phase root cause process
- `use-verify` - Ensure it's actually fixed

**Architecture**
- `use-architect` - Validate architecture before implementation

**Collaboration**
- `use-brainstorm` - Socratic design refinement
- `use-plan-create` - Detailed implementation plans
- `use-plan-execute` - Batch execution with checkpoints
- `use-agents-dispatch` - Concurrent subagent workflows
- `use-subagents-dispatch` - Fast iteration with two-stage review
- `use-review-request` - Pre-review checklist
- `use-review-feedback` - Responding to feedback
- `use-branch-complete` - Merge/PR decision workflow
- `use-worktrees` - Parallel development branches

**Meta**
- `use-skill-create` - Create new skills following best practices
- `use-autonome` - Introduction to the skills system

## Workflow Stages

Skills activate automatically. The agent detects which phase you are in and loads the appropriate workflow.

### 1. Intent Extraction
Before any code is written, the agent extracts your intent through structured questions. It explores alternatives with clear trade-offs before recommending an approach. The resulting design is presented in digestible sections for your approval.

### 2. Architecture Review
After design approval, the agent validates architectural decisions before implementation. It reviews component boundaries, data flow, dependencies, and change vectors. For significant decisions, it creates Architecture Decision Records (ADRs). This catches structural issues at $10 cost instead of $1000 later.

### 3. Isolated Workspace
After architecture review, the agent creates a dedicated git worktree on a new branch. This provides a fully isolated development environment where multiple features can be built simultaneously without interference.

### 4. Implementation Planning
The agent compresses the specification into small executable tasks (2-5 minutes each). Tasks include exact file paths, complete code snippets, and verification commands with expected output. Everything follows strict TDD discipline.

### 5. Execution
Two execution modes are available:
- **use-subagents-dispatch** runs in the same session with fresh subagents for each task and automatic two-stage reviews
- **use-plan-execute** runs tasks in batches with human checkpoints between batches

### 6. Quality Gates
Reviews run between tasks. The first review checks spec compliance to confirm the correct problem was solved. The second review checks code quality. Issues trigger fix-and-review loops until both gates pass.

### 7. Completion & Cleanup
When all tasks are complete, the agent runs the full test suite, presents integration options, and cleans up the worktree.

## Updating

Skills update automatically when you update the plugin:

```bash
/plugin update autonome
```

## Technical Details

For detailed information on how Autonome handles context, why it scales, and architectural decisions, see [docs/TECHNICAL.md](docs/TECHNICAL.md).
