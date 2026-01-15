# Architect Skill Integration Test

This test verifies that the `use-architect` skill correctly:
1. Detects the domain (frontend/backend/fullstack)
2. Asks relevant architectural questions
3. Reviews architecture for the domain
4. Documents architecture decisions

## Test Scenarios

### Scenario 1: Frontend Feature - Todo List App

**Requirements:**
"Build a todo list app with add/edit/delete todos, filter by status, and persist to localStorage."

**Expected behavior:**
- Skill detects this is a frontend feature (React, localStorage, UI components)
- Asks about:
  - Component hierarchy (App, TodoList, TodoItem, AddTodo, FilterBar)
  - State management (local component state vs global state management)
  - Data flow (unidirectional vs bidirectional)
  - Filter logic (client-side vs server-side)
- Identifies that localStorage is appropriate for this simple use case
- May flag that for complex todos, a backend would be needed

### Scenario 2: Backend API - User Management

**Requirements:**
"Build a user management API with CRUD operations, authentication, and role-based access control."

**Expected behavior:**
- Skill detects this is a backend feature (API, database, auth)
- Asks about:
  - API contract design (REST vs GraphQL, versioning)
  - Database schema (user model, role relationships)
  - Authentication strategy (JWT vs OAuth, session vs token)
  - Service boundaries (user service, auth service separate?)
  - API middleware pattern (auth, logging, error handling)
- May suggest separation of concerns (auth logic vs user management)

### Scenario 3: Fullstack Feature - Blog Platform

**Requirements:**
"Build a blog platform where users can create posts, comment on posts, and follow other users."

**Expected behavior:**
- Skill detects this is fullstack (frontend UI + backend API + database)
- Asks about:
  - API contract (what endpoints? what data models?)
  - Where does frontend responsibility end and backend begin?
  - Shared types/models (how are they synchronized?)
  - Deployment boundaries (monolith vs microservices?)
  - Data flow across the stack
- Should identify the clear API boundary and data contract

## Verification Criteria

For each scenario, verify:
1. ✅ Skill was invoked (Skill tool called with `use-architect`)
2. ✅ Domain was detected (frontend/backend/fullstack)
3. ✅ Universal architectural questions were asked (entities, boundaries, dependencies, data flow, testability)
4. ✅ Domain-specific questions were asked (based on detected domain)
5. ✅ Architecture decisions were documented (written to files or conversation)

## Running the Test

For each scenario:
```bash
# Create test project with requirements
# Run Claude Code with the skill
# Verify the skill was used correctly
# Check that architectural questions were asked
# Verify decisions were documented
```

## Expected Token Usage

- Main session: ~1000-2000 tokens (reading requirements, architectural analysis)
- Questions: Multiple question-answer cycles (one at a time per skill guidelines)
- Documentation: Output depends on complexity of architecture decisions
