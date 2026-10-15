# midagedev/homebrew-tap

```sh
brew install midagedev/tap/gadak        # the macOS app (cask) — the bundled CLI lands on PATH too
brew install midagedev/tap/gadak-cli    # CLI only (macOS + Linux)
brew install midagedev/tap/bloomery     # LLM inference server (Linux x86-64, NVIDIA GPU)
brew install midagedev/tap/mwoyeo       # live, in-place screen translation (macOS 27, Apple silicon)
```

[gadak](https://github.com/midagedev/gadak) — your Jira and Confluence,
mirrored into one local SQLite file: a macOS app, a web UI, and a SQL/CLI/MCP
surface for agents.

[Mwoyeo](https://github.com/midagedev/mwoyeo) — put a lens over any part of the
screen and read it in your language: the text is erased and the translation
painted in its place, on-device.

**Renamed at v0.14 (2026-08-15):** the formula `gadak` became `gadak-cli`, and
`gadak` is now the app cask. If you installed the old formula:

```sh
brew uninstall gadak && brew install midagedev/tap/gadak-cli
```

Installing both `gadak` (cask) and `gadak-cli` conflicts on `bin/gadak` —
pick one. `brew install midagedev/tap/scry` was retired at v0.12.

The formula and the cask are updated by the release pipeline; checksums come
from each release's own artifacts.
