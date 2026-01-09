# React Todo List - Design

## Overview

A simple todo list application built with React and Vite. Supports creating, completing, and deleting todos with localStorage persistence.

## Features

- Add new todos
- Mark todos as complete/incomplete
- Delete todos
- Filter by: All / Active / Completed
- Clear all completed todos
- Persist to localStorage
- Show count of remaining items

## User Interface

```
┌─────────────────────────────────────────┐
│  React Todos                            │
├─────────────────────────────────────────┤
│  [________________________] [Add]       │
├─────────────────────────────────────────┤
│  [ ] Buy groceries                  [x] │
│  [✓] Walk the dog                   [x] │
│  [ ] Write code                     [x] │
├─────────────────────────────────────────┤
│  2 items left                           │
│  [All] [Active] [Completed]  [Clear ✓]  │
└─────────────────────────────────────────┘
```

## Components

```
src/
  App.tsx              # Main app, state management
  components/
    TodoInput.tsx      # Text input + Add button
    TodoList.tsx       # List container
    TodoItem.tsx       # Single todo with checkbox, text, delete
    FilterBar.tsx      # Filter buttons + clear completed
  hooks/
    useTodos.ts        # Custom hook for todo state management
  utils/
    storage.ts         # localStorage persistence
    filterTodos.ts     # Filter logic
  types/
    index.ts           # TypeScript interfaces
```

## Data Model

```typescript
interface Todo {
  id: string;        // UUID
  text: string;      // Todo text
  completed: boolean;
}

type Filter = 'all' | 'active' | 'completed';
```

## Acceptance Criteria

1. Can add a todo by typing and pressing Enter or clicking Add
2. Can toggle todo completion by clicking checkbox
3. Can delete a todo by clicking X button
4. Filter buttons show correct subset of todos
5. "X items left" shows count of incomplete todos
6. "Clear completed" removes all completed todos
7. Todos persist across page refresh (localStorage)
8. Empty state shows helpful message
9. All tests pass
