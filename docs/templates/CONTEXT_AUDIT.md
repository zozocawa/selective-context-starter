# Context Audit

Run this before building your Selective Context system. Five questions, 30 seconds.

## Quick Diagnosis

| # | Question | Yes | No |
|---|----------|-----|-----|
| 1 | Does your AI take more than 30 seconds to start working in a fresh session? | ☐ | ☐ |
| 2 | Does your AI forget what it's doing mid-way through a multi-step task? | ☐ | ☐ |
| 3 | Do you regularly see "context compressed" or similar memory warnings? | ☐ | ☐ |
| 4 | Does your AI ask questions you've already answered in previous sessions? | ☐ | ☐ |
| 5 | Have you added more instructions hoping the AI would improve, but it didn't? | ☐ | ☐ |

**If you answered Yes to 2 or more, you have context chaos.** The solution is 60 minutes away.

## Token Audit

List every file or document your AI always loads.

| File / Document | Lines | Est. Tokens (lines × 1.3) | Essential? |
|-----------------|-------|---------------------------|------------|
| (example) spec.md | 102 | ~1326 | Yes |
| (example) framework-guide.md | 400 | ~520 | No |
| | | | |
| **Total** | | | |

**Essential = Yes**: The AI would fail catastrophically without this file in every session.

**If total exceeds 2,400 tokens**, you're at Level 1 — Chaos.
