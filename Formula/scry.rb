# Generated for scry v0.2.1. Future releases update this file from goreleaser
# (.goreleaser.yaml `brews:`); until the tap token exists it is written by hand
# from the release's own checksums.txt.
class Scry < Formula
  desc "Local SQLite mirror of your Jira issues — web UI, TUI, and agent SQL"
  homepage "https://github.com/midagedev/scry"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/midagedev/scry/releases/download/v0.2.1/scry_0.2.1_darwin_arm64.tar.gz"
      sha256 "06e21574e36663ced29754c1b75bb97aa5c60ea4e0ed5ef5eb102f5580ad541d"
    end
    on_intel do
      url "https://github.com/midagedev/scry/releases/download/v0.2.1/scry_0.2.1_darwin_amd64.tar.gz"
      sha256 "eb34d84b8c5a51eff04cbf90ef962952c10d15fae17b3bbef88b3c9d9664131a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/midagedev/scry/releases/download/v0.2.1/scry_0.2.1_linux_arm64.tar.gz"
      sha256 "39081c5de8d5b10180303997ecdbc241fa523911cd16627fc30859b3f521a05d"
    end
    on_intel do
      url "https://github.com/midagedev/scry/releases/download/v0.2.1/scry_0.2.1_linux_amd64.tar.gz"
      sha256 "9ca129194358f9df7d15d0038bb259e66df707455f8479ce8676b62629867575"
    end
  end

  def install
    bin.install "scry"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scry version")
  end
end
