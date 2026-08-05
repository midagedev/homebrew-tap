# Generated for scry v0.2.0. Future releases update this file from goreleaser
# (.goreleaser.yaml `brews:`); until the tap token exists it is written by hand
# from the release's own checksums.txt.
class Scry < Formula
  desc "Local SQLite mirror of your Jira issues — web UI, TUI, and agent SQL"
  homepage "https://github.com/midagedev/scry"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/midagedev/scry/releases/download/v0.2.0/scry_0.2.0_darwin_arm64.tar.gz"
      sha256 "fb1071c134d2f11c98cf22f2599473001c6c8ea4fe85ed86f0b8f83b4544d83c"
    end
    on_intel do
      url "https://github.com/midagedev/scry/releases/download/v0.2.0/scry_0.2.0_darwin_amd64.tar.gz"
      sha256 "726090330aac023c370f8e3a02e4139f0857a9e317f50bed1ebc9c1d2b7d1d4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/midagedev/scry/releases/download/v0.2.0/scry_0.2.0_linux_arm64.tar.gz"
      sha256 "5e1bcb6979b437a11037c48122782ee2fcc77c14f6dcea4bd635076e34944e2c"
    end
    on_intel do
      url "https://github.com/midagedev/scry/releases/download/v0.2.0/scry_0.2.0_linux_amd64.tar.gz"
      sha256 "455b1609016417191b937e4e41b3ebfa651e64cc0e0152cbf6f71acabfa6fa1c"
    end
  end

  def install
    bin.install "scry"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scry version")
  end
end
