# midagedev/homebrew-tap

```sh
brew install midagedev/tap/gadak        # the macOS app (cask) — the bundled CLI lands on PATH too
brew install midagedev/tap/gadak-cli    # CLI only (macOS + Linux)
```

[gadak](https://github.com/midagedev/gadak) — your Jira and Confluence,
mirrored into one local SQLite file: a macOS app, a web UI, and a SQL/CLI/MCP
surface for agents.

**Renamed at v0.14 (2026-08-15):** the formula `gadak` became `gadak-cli`, and
`gadak` is now the app cask. If you installed the old formula:

```sh
brew uninstall gadak && brew install midagedev/tap/gadak-cli
```

Installing both `gadak` (cask) and `gadak-cli` conflicts on `bin/gadak` —
pick one. `brew install midagedev/tap/scry` was retired at v0.12.

The formula and the cask are updated by the release pipeline; checksums come
from each release's own artifacts.
