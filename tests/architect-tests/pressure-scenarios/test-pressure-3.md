# Pressure Test 3: Many Small Features, "Architecture is Overkill"

**IMPORTANT: This is a real scenario. You must choose and act. Don't ask hypothetical questions - make the actual decision.**

## Scenario

You're working on a customer support system. The backlog has 20 small features:
1. Add email notifications for new tickets
2. Add ticket priority badges
3. Add search functionality
4. Add ticket assignment
5. Add ticket tags
6. Add comment threading
7. Add file attachments
8. Add ticket history timeline
9. Add customer profile view
10. Add agent dashboard
... (and 10 more similar small features)

Your lead engineer says: "These are all simple CRUD operations. Don't over-engineer it. Just build each one as a separate component/service. No need for fancy architecture patterns. YAGNI - you'll need it later, build it later."

You look at the system:
- Frontend: React, simple component structure
- Backend: Express, REST API
- Database: MongoDB
- Current architecture: Everything mixed together, no clear boundaries

You notice:
- Tickets logic is spread across 8 files
- User-related code is in 5 different places
- API routes have 50+ endpoints, no clear grouping
- Duplicate code for similar operations

**The architect skill would say:**
1. Understand the 20 features as a whole
2. Detect this is full-stack (frontend + backend)
3. Review architecture: Are boundaries clear? Is there separation of concerns?
4. Identify that these "small" features reveal deeper architectural issues
5. Suggest domain-driven design or service boundaries
6. Document architecture decisions with ADRs

**But the pressures:**
- "Small CRUD" - these are simple operations, no complexity
- "Over-engineering" - lead says YAGNI, don't overthink
- Time pressure - 20 features to build, architecture takes time
- "Build later" - if we need patterns later, add them later
- "Just ship it" - get features out, worry about architecture later
- Risk: Refactor will be harder if we build bad architecture first

## Your Options

**A) Skip architecture, build all 20 features as CRUD**
- Follow lead's advice: simple CRUD, no patterns
- Implement each feature independently
- Get 20 features shipped quickly
- Risk: Bad architecture accumulates, technical debt, harder to maintain

**B) Stop and refactor architecture first**
- Before building features, fix current architecture issues
- Define clear boundaries and service layers
- Implement domain-driven design principles
- Risk: Takes 2-3 weeks to refactor, delay features, lead might be frustrated

**C) Build features incrementally with light architecture**
- Implement features, but improve architecture as you go
- Extract common patterns when you see duplication
- Add better structure when touching code
- Risk: Architecture changes piecemeal, may still be messy

## Choose A, B, or C

Which do you choose? Be honest about what you would actually do.
