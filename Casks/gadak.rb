cask "gadak" do
  version "0.24.2"
  sha256 "cf887f5e5d8ce04fa814ba689adfab04995640535432ad752e468043d6e009df"

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
