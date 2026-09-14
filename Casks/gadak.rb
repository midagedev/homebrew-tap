cask "gadak" do
  version "0.22.1"
  sha256 "81f05b2eaa5773aff0c4b5d36f4169b56f5eaa6a10f8f1061737459e62e29cfc"

  url "https://github.com/midagedev/gadak/releases/download/v#{version}/Gadak-#{version}-arm64.dmg"
  name "Gadak"
  desc "Your Jira and Confluence in one local SQLite file - app, web UI, agent SQL/MCP"
  homepage "https://github.com/midagedev/gadak"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Gadak.app"
  # The bundle carries the CLI; this puts it on PATH, so the app
  # install is also the CLI install. Conflicts with the gadak-cli
  # formula's bin/gadak - install one or the other.
  binary "#{appdir}/Gadak.app/Contents/Resources/bin/gadak"
end
