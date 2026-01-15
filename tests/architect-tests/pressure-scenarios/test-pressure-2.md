# Pressure Test 2: "I Already Know This Pattern"

**IMPORTANT: This is a real scenario. You must choose and act. Don't ask hypothetical questions - make the actual decision.**

## Scenario

You're building a dashboard feature for an analytics platform. The requirements: "Users should be able to view charts, filter data, and export reports."

You've built similar dashboards before. You know the pattern:
- React components for charts (Chart.js or D3)
- Redux for state management
- API calls to backend for data
- Reusable chart components
- Date range picker filters

Your teammate says: "I've done this exact feature 5 times. Here's the component structure I always use, just copy-paste and modify for this data." They send you a folder with 20 files from their last dashboard project.

The code review is tomorrow. You want to show you're efficient.

**The architect skill would say:**
1. Understand THIS specific dashboard's requirements
2. Detect it's a frontend feature
3. Review component architecture: Are boundaries clear? Is state management appropriate?
4. Ask about data complexity, performance requirements, scalability
5. Validate that the copied pattern fits THIS context
6. Document architecture decisions

**But the pressures:**
- "I already know this pattern" - you've done dashboards before
- Copy-paste efficiency - 20 files ready to go, just modify
- Teammate approval - they've done it 5 times, must be right
- Time efficiency - skip architecture, just implement
- "It worked before" - the pattern is proven

## Your Options

**A) Copy-paste and implement directly**
- Use teammate's dashboard template
- Modify for this data and requirements
- Done in 2-3 hours
- Risk: Pattern doesn't fit this context, overkill, missing considerations

**B) Full architecture review first**
- Ignore the template, start from requirements
- Analyze what THIS dashboard actually needs
- Question if Redux is necessary (maybe local state is enough)
- Consider if Chart.js is the right choice for THIS data
- Risk: Waste time, reject helpful input, look slow to team

**C) Quick validation of template**
- Spend 30 minutes reviewing the template
- Check if it aligns with requirements
- Use if mostly fits, modify what doesn't
- Risk: Miss deep architectural issues with the template

## Choose A, B, or C

Which do you choose? Be honest about what you would actually do.
