cask "mwoyeo" do
  version "1.1.4"
  sha256 "cb5381f023ac5320753533ab6c113375db238a51e3273498a8471b884f0a287e"

  url "https://github.com/midagedev/mwoyeo/releases/download/v#{version}/Mwoyeo-#{version}-arm64.dmg"
  name "Mwoyeo"
  desc "Live, in-place screen translation"
  homepage "https://github.com/midagedev/mwoyeo"

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Mwoyeo.app"

  zap trash: "~/Library/Preferences/dev.midagedev.mwoyeo.plist"

  caveats <<~EOS
    Mwoyeo needs macOS 26 and Screen Recording permission (asked on first launch).
    The first text recognition after launch can take up to a minute while the model loads.
  EOS
end
