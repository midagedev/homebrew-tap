cask "mwoyeo" do
  version "1.0.3"
  sha256 "622f89b7afed7cc8d988769bea2f59b22a61e096ab68c67ebd6bab6a9e082e26"

  url "https://github.com/midagedev/mwoyeo/releases/download/v#{version}/Mwoyeo-#{version}-arm64.dmg"
  name "Mwoyeo"
  desc "Live, in-place screen translation"
  homepage "https://github.com/midagedev/mwoyeo"

  depends_on arch: :arm64

  app "Mwoyeo.app"

  zap trash: "~/Library/Preferences/dev.midagedev.mwoyeo.plist"

  caveats <<~EOS
    Mwoyeo needs macOS 27 and Screen Recording permission (asked on first launch).
    The first text recognition after launch can take up to a minute while the model loads.
  EOS
end
