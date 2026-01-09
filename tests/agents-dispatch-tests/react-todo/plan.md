# React Todo List - Implementation Plan

Execute this plan using the `autonome:use-subagents-dispatch` skill.

## Context

Building a todo list app with React and Vite. See `design.md` for full specification.

## Tasks

### Task 1: Project Setup

Create the React project with Vite.

**Do:**
- Run `npm create vite@latest . -- --template react-ts`
- Install dependencies with `npm install`
- Verify dev server works
- Clean up default Vite template content from App.tsx

**Verify:**
- `npm run dev` starts server
- App shows minimal "React Todos" heading
- `npm run build` succeeds

---

### Task 2: Types and Interfaces

Define TypeScript types for the application.

**Do:**
- Create `src/types/index.ts`
- Define `Todo` interface with id, text, completed
- Define `Filter` type as 'all' | 'active' | 'completed'
- Export all types

**Verify:**
- Types are importable from other files
- No TypeScript errors

---

### Task 3: localStorage Persistence

Add persistence utilities for todos.

**Do:**
- Create `src/utils/storage.ts`
- Implement `loadTodos(): Todo[]` and `saveTodos(todos: Todo[])`
- Handle JSON parse errors gracefully (return empty array)
- Add JSDoc comments
- Create `src/utils/storage.test.ts` with tests for load/save/error handling

**Verify:**
- Tests pass: `npm run test` (install vitest if needed)
- Manual test: save/load works with valid JSON
- Error handling works with invalid localStorage data

---

### Task 4: Custom Hooks

Create React hooks for todo state management.

**Do:**
- Create `src/hooks/useTodos.ts`
- Implement custom hook with:
  - State for todos array
  - Load from localStorage on mount
  - Save to localStorage on changes
  - Functions: `addTodo(text)`, `toggleTodo(id)`, `deleteTodo(id)`, `clearCompleted()`
- Create `src/hooks/useTodos.test.ts` with tests for each function

**Verify:**
- Tests pass
- Hook properly manages state and persistence

---

### Task 5: TodoInput Component

Create the input component for adding todos.

**Do:**
- Create `src/components/TodoInput.tsx`
- Use controlled input with local state
- Add button calls `onAddTodo` prop and clears input
- Enter key also submits
- Disable Add button when input is empty or whitespace only
- Add component tests using React Testing Library

**Verify:**
- Tests pass
- Component renders input and button
- Props interface is properly typed

---

### Task 6: TodoItem Component

Create the single todo item component.

**Do:**
- Create `src/components/TodoItem.tsx`
- Props: `todo: Todo`, `onToggle: (id: string) => void`, `onDelete: (id: string) => void`
- Checkbox toggles completion
- Text with strikethrough when completed
- Delete button (X) calls onDelete
- Add component tests

**Verify:**
- Tests pass
- Component renders checkbox, text, delete button
- Callbacks work correctly

---

### Task 7: TodoList Component

Create the list container component.

**Do:**
- Create `src/components/TodoList.tsx`
- Props: `todos: Todo[]`, `onToggle`, `onDelete`
- Maps over todos and renders TodoItem for each
- Shows "No todos yet" when empty
- Add component tests

**Verify:**
- Tests pass
- Component renders list of TodoItems
- Empty state shows correctly

---

### Task 8: FilterBar Component

Create the filter and status bar component.

**Do:**
- Create `src/components/FilterBar.tsx`
- Props: `todos: Todo[]`, `currentFilter: Filter`, `onFilterChange: (f: Filter) => void`, `onClearCompleted: () => void`
- Show count: "X items left" (incomplete count)
- Three filter buttons: All, Active, Completed
- Active filter is visually highlighted
- "Clear completed" button (hidden when no completed todos)
- Add component tests

**Verify:**
- Tests pass
- Component renders count, filters, clear button
- Filter state is properly highlighted

---

### Task 9: App Integration

Wire all components together in App.tsx.

**Do:**
- Import all components and custom hook
- Use `useTodos` hook for state management
- Add filter state with useState (default: 'all')
- Compute filtered todos based on filter state
- Render: heading, TodoInput, TodoList, FilterBar
- Pass appropriate props to each component

**Verify:**
- App renders all components
- Adding todos works
- Toggling works
- Deleting works

---

### Task 10: Filter Functionality

Ensure filtering works end-to-end.

**Do:**
- Create filter utility function in `src/utils/filterTodos.ts`
- Implement logic for each filter type
- Verify filter buttons change displayed todos
- 'all' shows all todos
- 'active' shows only incomplete todos
- 'completed' shows only completed todos
- Clear completed removes completed todos and resets filter if needed
- Add integration tests

**Verify:**
- Filter tests pass
- Manual verification of all filter states

---

### Task 11: Styling and Polish

Add CSS styling for usability.

**Do:**
- Create `src/App.css` with styles
- Style the app to match the design mockup
- Completed todos have strikethrough and muted color
- Active filter button is highlighted
- Input has focus styles
- Delete button appears on hover (or always on mobile)
- Responsive layout

**Verify:**
- App is visually usable
- Styles don't break functionality

---

### Task 12: End-to-End Tests

Add Playwright tests for full user flows.

**Do:**
- Install Playwright: `npm init playwright@latest`
- Create `tests/todo.spec.ts`
- Test flows:
  - Add a todo
  - Complete a todo
  - Delete a todo
  - Filter todos
  - Clear completed
  - Persistence (add, reload, verify)

**Verify:**
- `npx playwright test` passes

---

### Task 13: README

Document the project.

**Do:**
- Create `README.md` with:
  - Project description
  - Tech stack: React, TypeScript, Vite
  - Setup: `npm install`
  - Development: `npm run dev`
  - Testing: `npm test` and `npx playwright test`
  - Build: `npm run build`

**Verify:**
- README accurately describes the project
- Instructions work
