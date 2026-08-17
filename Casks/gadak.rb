cask "gadak" do
  version "0.15.0"
  sha256 "1e104abc33b6d7e6c9e4395fefd326c7e8d06cd5c30289009a7d5562f1428585"

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
