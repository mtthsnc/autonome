# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-01-09

### Added
- N/A

### Changed
- Marketplace plugin renamed from `autonome@autonome-dev` to `autonome@autonome-plugins`

### Fixed
- N/A

## [1.0.0] - 2026-01-08

### Added

#### Core Skills Library
- **Testing**
  - `using-tdd` - RED-GREEN-REFACTOR cycle enforcement with testing anti-patterns reference
- **Debugging**
  - `flow-debug` - 4-phase root cause debugging process with root-cause-tracing, defense-in-depth, and condition-based-waiting techniques
  - `flow-verify` - Post-fix verification workflow
- **Collaboration Workflows**
  - `brainstorm` - Socratic design refinement through interactive questioning
  - `plan-create` - Detailed implementation plan generation
  - `plan-execute` - Batch execution with human checkpoints
  - `using-worktrees` - Parallel development branch management
  - `agents-dispatch` - Concurrent subagent workflow orchestration
  - `subagents-dispatch` - Fast iteration with two-stage review (spec compliance, then code quality)
  - `review-request` - Pre-review checklist automation
  - `review-feedback` - Structured feedback response workflow
  - `branch-complete` - Merge/PR decision workflow with cleanup
- **Meta Skills**
  - `skill-create` - Create new skills following best practices with testing methodology
  - `using-autonome` - Introduction and onboarding to the skills system

#### Platform Support
- Claude Code plugin system integration with marketplace support
- Codex platform compatibility with bootstrap installation
- OpenCode platform compatibility with plugin loader

#### Infrastructure
- Session hooks system (`hooks.json`, `session-start.sh`, `run-hook.cmd`)
- Core skills library (`lib/skills-core.js`)
- Polyglot hooks support for Windows environments
- Git worktree management for isolated development

#### Commands
- `/autonome:brainstorm` - Interactive design refinement command
- `/autonome:plan-create` - Implementation plan creation command
- `/autonome:plan-execute` - Batch execution command

#### Documentation
- Comprehensive README with workflow philosophy and installation instructions
- Platform-specific guides for Claude Code, Codex, and OpenCode
- Testing methodology and anti-patterns documentation
- Windows compatibility guide for polyglot hooks
- Code reviewer agent specifications

#### Testing Framework
- Agents dispatch integration tests with Go fractals and React TODO examples
- Claude Code skill testing suite with token usage analysis
- Explicit skill request testing with multi-turn conversation scenarios
- Skill triggering tests for automatic activation
- OpenCode plugin loading and priority tests
- Test helpers and automation scripts

#### Examples & References
- Anthropic best practices integration
- Persuasion principles for agent communication
- GraphViz conventions for visualization
- Testing skills with subagents guide
- Condition-based waiting examples
- Academic and pressure test scenarios

### Changed
- N/A (initial release)

### Deprecated
- N/A (initial release)

### Removed
- N/A (initial release)

### Fixed
- N/A (initial release)

### Security
- N/A (initial release)