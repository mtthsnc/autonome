# Technical Details

## Why Autonome Scales

### Context Management

The system's efficiency comes from how it handles context. Instead of accumulating noise across a long conversation, it compresses intent through clear stages. Rough ideas become validated designs, designs become executable plans, and plans become isolated tasks. Each transformation preserves what matters and discards what does not.

### Fresh Subagents

Fresh subagents execute each task without context pollution. They receive only what is required: a curated task description, relevant architectural context, and the ability to ask clarifying questions. They do not inherit information from previous tasks that could confuse or bias their decisions. The controlling agent reads the plan once and injects only the relevant sections, eliminating file navigation overhead.

### Persistent Artifacts

Persistent artifacts act as external memory. Design documents and implementation plans live on disk as a single source of truth that survives session boundaries. Any agent can resume work without summarization loss. Humans review and approve at each stage, ensuring intent remains locked in.

### Two-Stage Review Gates

Two-stage review gates provide efficient filtering. Spec compliance reviews catch scope creep before code is refined. Code quality reviews run only on implementations that already meet requirements. This avoids wasted effort on well-crafted solutions to the wrong problem.

### Linear Scaling

The result is a system where context scales linearly while work compounds. An agent can run for hours across dozens of tasks without degradation, because each task starts with precisely the context it needs, no more and no less.

## Workflow Phases in Detail

### Skills Activation

Skills activate automatically. The agent detects which phase you are in and loads the appropriate workflow. These are enforced processes, not suggestions. When it is time to plan, the agent plans. When it is time to review, the agent reviews. Skills chain together naturally. Brainstorming leads to worktrees, worktrees lead to planning, and planning leads to execution. The system manages context so you do not have to.

### 1. Intent Extraction: `use-brainstorm`

Activates before any creative work begins. The agent pauses and extracts your intent through Socratic questioning, one question at a time. Questions are often multiple choice to make decisions easier. The agent explores two or three alternative approaches with clear trade-offs before recommending one.

The resulting design is presented back to you in digestible sections of roughly 200 to 300 words. Validation happens incrementally instead of all at once. This first compression step turns vague ideas into concrete specifications that are saved as design documents and treated as the single source of truth.

**Context efficiency:** Progressive validation catches misalignment early. Humans approve intent before any code exists, preventing wasted implementation effort.

### 2. Isolated Workspace: `use-worktrees`

Activates after design approval. The agent creates a dedicated git worktree on a new branch, providing a fully isolated development environment. It runs project setup, verifies that the test baseline is clean, and establishes the working directory.

**Context efficiency:** Isolation enables parallel-safe development. Multiple features can be built simultaneously without interference. Work is compartmentalized from the start.

### 3. Executable Translation: `use-plan-create`

Activates once the design is approved. The agent compresses the specification into small, executable tasks designed to take two to five minutes each. Tasks are detailed enough that a context-free developer could execute them correctly. Each task includes exact file paths, complete code snippets, and verification commands with expected output.

Tasks follow strict TDD discipline. A failing test is written first, the test is run to confirm failure, minimal implementation code is added, and the test is run again to confirm success. Each step is committed immediately. YAGNI prevents scope creep, DRY avoids duplication, and everything remains testable.

**Context efficiency**: The controlling agent reads the plan once. Subagents never read the full plan. Relevant sections are extracted and injected directly into task prompts, eliminating file navigation overhead.

### 4. Fresh Context Execution: `use-subagents-dispatch` or `use-plan-execute`

Activates once the plan exists. Two execution modes are available.

**use-subagents-dispatch** runs in the same session. A fresh subagent is dispatched for each task with no accumulated context. Each subagent receives only curated input: the task description, relevant architectural context, and the ability to ask clarifying questions. No information from previous tasks is included.

After implementation, two review subagents run sequentially. The first checks spec compliance to confirm the correct problem was solved. The second reviews code quality. Any issues trigger fix-and-review loops until both gates pass.

**plan-execute** runs tasks in batches with human checkpoints between batches. This mode is useful for parallel work or when explicit approval gates are required.

**Context efficiency:** Fresh subagents prevent context pollution. The controlling agent injects exactly the context each task requires. Two-stage review prevents wasted refinement on incorrect solutions.

### 5. Disciplined Testing: `use-tdd`

Activates during implementation. The agent enforces genuine RED-GREEN-REFACTOR. Tests must fail first, then pass with minimal implementation. Code written before tests is removed. Each commit represents a verified checkpoint.

**Context efficiency:** Tests encode intent and act as durable verification. Future subagents can build on working commits without reconstructing the full reasoning context.

### 6. Quality Gates: `use-review-request`

Activates between tasks. The agent reviews implementations against the plan specification and categorizes issues by severity. Critical issues block progress to the next task.

**Context efficiency:** Early review prevents cascading errors. Fixing issues while context is fresh is significantly cheaper than debugging later.

### 7. Completion & Cleanup: `use-branch-complete`

Activates when all tasks are complete. The agent runs the full test suite, presents integration options such as merging to main or opening a pull request, and cleans up the worktree. The system guides the transition from isolated development back to the main branch.

**Context efficiency:** Clear boundaries keep development isolated until verification is complete. Integration happens atomically, with no partial merges or lingering branches.
