# 🧹 cleanmac Homebrew Tap

> 🍺 Official Homebrew tap for **cleanmac** — a dry-run-first macOS cleanup CLI with safety guardrails.

---

## 🚀 Install

```bash
brew tap cleanmac/tap
brew trust cleanmac/tap
brew install cleanmac
```

Homebrew 6+ requires explicit trust for third-party taps before loading their formulae. If you prefer to trust only this formula instead of the whole tap, run:

```bash
brew trust --formula cleanmac/tap/cleanmac
brew install cleanmac
```

Verify the installation:

```bash
cleanmac --json capabilities
```

---

## ✨ What is cleanmac?

`cleanmac` is a safety-focused macOS cleanup command-line tool:

- 🧪 **Dry-run first** — cleanup commands preview by default
- 🛡️ **Explicit execution gates** — destructive actions require confirmation flags
- 🧾 **Review-based execution** — review selections can constrain cleanup execution
- 🤖 **AI/MCP friendly** — structured JSON output and tool definitions
- 📦 **Pure Python** — distributed as a Homebrew formula with Python virtualenv isolation

---

## 🧪 Smoke test

After installing, run:

```bash
cleanmac --json capabilities | python3 -m json.tool >/dev/null
```

You can also run Homebrew's formula test:

```bash
brew test cleanmac
```

---

## 🧰 Common commands

```bash
# List cleanup categories
cleanmac clean list

# Safe preview only — no deletion
cleanmac --json clean inspect --categories trash --limit 10

# Generate a dry-run cleanup plan
cleanmac --json plan --categories trash --max-items 10
```

> ⚠️ `cleanmac` does not delete files by default. Real cleanup requires explicit execution flags.

---

## 🔄 Upgrade

```bash
brew update
brew upgrade cleanmac
```

---

## 🧹 Uninstall

```bash
brew uninstall cleanmac
brew untap cleanmac/tap
```

---

## 🔗 Links

- 🏠 Project: <https://github.com/imajinyun/cleanmac>
- 🍺 Formula: [`Formula/cleanmac.rb`](Formula/cleanmac.rb)
- 🔒 Safety model: dry-run first, explicit execution, review-constrained cleanup
