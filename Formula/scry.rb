# Generated for scry v0.3.0. Future releases update this file from goreleaser
# (.goreleaser.yaml `brews:`); until the tap token exists it is written by hand
# from the release's own checksums.txt.
class Scry < Formula
  desc "Local SQLite mirror of your Jira issues — web UI, TUI, and agent SQL"
  homepage "https://github.com/midagedev/scry"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/midagedev/scry/releases/download/v0.3.0/scry_0.3.0_darwin_arm64.tar.gz"
      sha256 "db46a60151533a554ae1bb25808951ffe8fc48dc795b15b8edbca3f8906aeefd"
    end
    on_intel do
      url "https://github.com/midagedev/scry/releases/download/v0.3.0/scry_0.3.0_darwin_amd64.tar.gz"
      sha256 "4fc3a25fa224efc32e5c05106bebc2d03908df3511a6fbd4a75903b6b5a2b1a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/midagedev/scry/releases/download/v0.3.0/scry_0.3.0_linux_arm64.tar.gz"
      sha256 "bfb06067f6400705826a3d03baa952eaceb9832fcf12581d5825c955dc015e43"
    end
    on_intel do
      url "https://github.com/midagedev/scry/releases/download/v0.3.0/scry_0.3.0_linux_amd64.tar.gz"
      sha256 "4660751cab3b1d86cab61745c75291c5747dc1ae18b5928121b0b8cc4f4f9e6b"
    end
  end

  def install
    bin.install "scry"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scry version")
  end
end
