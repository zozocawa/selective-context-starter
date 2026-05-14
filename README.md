# Selective Context Starter

**A working AI context system in 5 minutes.**

Built for [OpenCode](https://opencode.ai).

---

## The Problem

Your AI assistant loads too much context at startup. Every file you inject eats tokens you'll never use. The result: context compression mid-task, repeated questions, and the "I forgot what we were doing" spiral.

If your AI takes more than 30 seconds to orient in a fresh session, you have context chaos.

---

## The Solution

Three files are loaded at every session start (the **constitution**). Everything else stays on disk until the AI explicitly requests it via a trigger map.

| Layer | What | Loaded |
|-------|------|--------|
| **Constitution** | `docs/spec/PROJECT_SPEC.md` — what you're building | Always |
| | `docs/spec/PROJECT_STATE.md` — where you stand | Always |
| | `docs/spec/PROTOCOL.md` — how to operate | Always |
| **Map** | `AGENTS.md` — trigger table for reference files | Always |
| **References** | Everything else (docs, guides, API refs) | On-demand |

This keeps forced context under 2,400 tokens. The AI never compresses, never forgets.

---

## Quick Start

1. **Open `docs/spec/PROJECT_SPEC.md`** and describe what you're building.
2. **Open `docs/spec/PROJECT_STATE.md`** and log your current status.
3. **Open `docs/spec/PROTOCOL.md`** — it's pre-filled and works immediately.
4. **Start a new OpenCode session.** The constitution loads automatically via `.opencode/opencode.json`.

That's it. Your AI now has permanent context awareness without bloat.

---

## Project Structure

```
├── .opencode/opencode.json   # Wires constitution to every session
├── AGENTS.md                  # Map — triggers for loading references
├── docs/
│   ├── spec/
│   │   ├── PROJECT_SPEC.md    # Constitution: what
│   │   ├── PROJECT_STATE.md   # Constitution: where
│   │   └── PROTOCOL.md        # Constitution: how
│   ├── guide.md               # 10-step playbook
│   └── templates/             # Ready-to-copy scaffolds
├── README.md
└── package.json
```

---

## How It Works

On every session, OpenCode injects the three constitution files into the system prompt. The AI scans `AGENTS.md` to find reference files by trigger condition. It only reads what it needs, when it needs it.

No configuration required. No plugins. No prompt engineering.

---

## Requirements

- [OpenCode](https://opencode.ai) (or any AI tool that supports file injection via `instructions`)

---

## Full Playbook

For the complete 10-step walkthrough: [`docs/guide.md`](docs/guide.md)

To copy fresh templates: [`docs/templates/`](docs/templates/)
