# Selective Context Starter

**Clone this repo, run one command, and your AI has a working context system in 5 minutes.**

Stop wasting tokens. Start shipping faster.

---

## Quick Start

```powershell
git clone https://github.com/gasseramin/selective-context-starter.git my-project
cd my-project
.\setup.ps1
```

The script will ask you two things:
- Your project name
- Your main domains (e.g., API, UI, Auth, Deploy)

That's it. Open the project in your AI tool and start working.

**Note for OpenCode users:** Skip the `/init` command — `AGENTS.md` is already provided. OpenCode will detect `.opencode/opencode.json` and load the constitution automatically.

---

## What You Get

| File | Purpose |
|------|---------|
| `docs/spec/PROJECT_SPEC.md` | What you're building — fill in your modules and fields |
| `docs/spec/PROJECT_STATE.md` | Where you stand — queue columns, progress, debt |
| `docs/spec/PROTOCOL.md` | How your AI operates — pre-built, works immediately |
| `AGENTS.md` | The map — your AI reads this to find the right instructions |
| `.opencode/opencode.json` | Wired to load constitution at startup |
| `docs/guide.md` | 10-step playbook from zero to working system |
| `docs/templates/` | Blank copies of every file for rapid iteration |

---

## Prerequisites

- OpenCode (any version)
- Git
- PowerShell 5.1+ (Windows) or PowerShell Core (macOS/Linux)

---

## How It Works

The Selective Context methodology separates what your AI **must** know (constitution) from what it **can look up** (reference). This frees ~80% of your context window for actual reasoning instead of overhead.

For the full rationale: *coming soon*

---

## Project Structure

```
my-project/
├── .opencode/
│   └── opencode.json          # Instructions config — loads constitution
├── .gitignore
├── AGENTS.md                  # The map — AI reads this to find references
├── docs/
│   ├── spec/
│   │   ├── PROJECT_SPEC.md    # Constitution: what you're building
│   │   ├── PROJECT_STATE.md   # Constitution: where you stand
│   │   └── PROTOCOL.md        # Constitution: how your AI operates
│   ├── templates/             # Blank copies for rapid setup
│   └── guide.md               # Step-by-step playbook
├── setup.ps1                  # Interactive setup script
├── package.json
└── README.md
```

---

## License

MIT
