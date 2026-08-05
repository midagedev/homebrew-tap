# Generated for scry v0.4.0. From the next release goreleaser rewrites this
# file itself (SSH deploy key, .goreleaser.yaml `brews:`).
class Scry < Formula
  desc "Local SQLite mirror of your Jira issues — web UI, TUI, and agent SQL"
  homepage "https://github.com/midagedev/scry"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/midagedev/scry/releases/download/v0.4.0/scry_0.4.0_darwin_arm64.tar.gz"
      sha256 "041897b6859efe096988604011eb93973041466994bcba41c1b479626bf8e6e8"
    end
    on_intel do
      url "https://github.com/midagedev/scry/releases/download/v0.4.0/scry_0.4.0_darwin_amd64.tar.gz"
      sha256 "4e6399aa039d92a8de152f1673d2cebc5b27580cf402c66032cae05c642c09d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/midagedev/scry/releases/download/v0.4.0/scry_0.4.0_linux_arm64.tar.gz"
      sha256 "7172ddfd5793e86f002506cc8b23a5ef035db26373f54b10451ffb5e92167c48"
    end
    on_intel do
      url "https://github.com/midagedev/scry/releases/download/v0.4.0/scry_0.4.0_linux_amd64.tar.gz"
      sha256 "9e3aa14746da7e91fb76d6dcb6b3b96b3e6807186b80b1dedf82eab7ec116adf"
    end
  end

  def install
    bin.install "scry"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scry version")
  end
end
