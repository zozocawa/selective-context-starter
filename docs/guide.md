# The Selective Context Playbook

*Build your first context system in 60 minutes. Zero fluff.*

---

## Before You Start: Do You Need This?

1. Does your AI take more than 30 seconds to start working in a fresh session?
2. Does it forget what it's doing mid-way through a multi-step task?
3. Do you see "context compressed" messages regularly?
4. Does it ask questions you've already answered in previous sessions?
5. Have you added more instructions hoping it would improve, but it didn't?

**Two or more Yes answers = you have context chaos.** Let's fix it.

---

## Step 1: Audit Your Mess

Open `docs/templates/CONTEXT_AUDIT.md`. List every file your AI loads at startup. Count lines, estimate tokens (lines × 1.3). Mark each as essential or not.

**Rule:** If the AI wouldn't fail catastrophically without it, it's noise.

**Done when:** You know your total forced token count. If it's above 2,400, you have work to do.

---

## Step 2: Identify Your Constitution

Pick the 1-3 files your AI genuinely can't function without. This is almost always:
- What you're building (spec, goal, project brief)
- Where you stand (current state, what's next)

Everything else is reference.

**Done when:** Your constitution fits under 2,400 tokens.

---

## Step 3: Build Your State Tracker

Use `docs/templates/PROJECT_STATE.md` (or copy to `docs/spec/PROJECT_STATE.md`). Include last action, active sprint with queue columns, modules table, features, and tech debt.

Use tables, not prose. The AI reads this every session — it needs to scan in under 5 seconds.

**Done when:** Someone unfamiliar can read this and know exactly what's happening.

---

## Step 4: Write Your Protocol

Use `docs/templates/PROTOCOL.md` (or copy to `docs/spec/PROTOCOL.md`). Cover pre-flight, queue discipline, task execution, discovery handler, closure, and conflict hierarchy.

The pre-filled version at `docs/spec/PROTOCOL.md` works immediately.

**Done when:** A new AI session can read this and know exactly how to operate.

---

## Step 5: Create the Map

Use `docs/templates/AGENTS.md` (or copy to `./AGENTS.md`). List every reference source with a one-line trigger condition.

Format:
| File | When |
|------|------|
| `path/to/domain-a.md` | Working on Domain A |

**Done when:** The AI can find any reference by reading the map and following a trigger.

---

## Step 6: Split Reference into Domains

If any reference file covers more than one topic, split it. Test: if the AI needs to skip more than half the file, it's too broad.

**Done when:** Every reference source has exactly one trigger in the map.

---

## Step 7: Wire It Up

The `.opencode/opencode.json` is already configured to load the constitution at startup. No configuration needed.

If you're not using OpenCode: configure your AI tool to load the constitution (3 files in `docs/spec/`) at session start, and reference the map (AGENTS.md) as step one.

**Done when:** A fresh session loads constitution in under 30 seconds.

---

## Step 8: Test It

Run three tests on a fresh session:

1. **Constitution recall** — Ask "What are we building and where do we stand?" Should answer accurately in <5 seconds.
2. **Map navigation** — Say "Find the reference for Domain X." AI should load the right file via the map.
3. **Multi-step task** — Give a 5-step task. Monitor for compaction. If it compacts, constitution is too large.

**Done when:** All three tests pass.

---

## Step 9: Iterate

Cut 10% of your forced context. Repeat until constitution is under 2,400 tokens and test 3 passes.

If cutting something breaks the AI, add it back. If the AI doesn't notice it's gone, it was noise.

**Done when:** Constitution fits under 2,400 tokens and 5-step tasks complete without compaction.

---

## Step 10: Maintain

| Frequency | Habit | Time |
|-----------|-------|------|
| **Daily** | Update PROJECT_STATE.md | 30 sec |
| **Weekly** | Audit AGENTS.md map accuracy | 5 min |
| **Monthly** | Cut 10% of forced context | 10 min |

**Done when:** You can prove the last time you updated state, audited the map, and cut context.

---

## Done Checklist

- [ ] Constitution is under 2,400 tokens
- [ ] Map lists every reference source with a one-line trigger
- [ ] Protocol covers: pre-flight, queue, closing bracket, discovery, conflict hierarchy
- [ ] State file exists and is up-to-date
- [ ] Fresh session starts in under 30 seconds
- [ ] No compaction on a 5-step multi-step task
- [ ] Original diagnosis symptoms are resolved or measurably improved

You don't need Level 4 to ship. Level 2 — Order — is already a massive improvement.
