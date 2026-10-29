# frozen_string_literal: true

# One release, three builds: Linux x86-64 (sm_86 PTX and AVX2 host kernels, NVIDIA
# GPUs), Linux arm64 for a GB10 (DGX Spark, sm_121a PTX) and Apple Silicon (the
# Metal backend, macOS 26.2 or newer, signed and notarized). Inside each tarball the binaries sit at
# bloomery-<version>-<platform>/bin/.
class Bloomery < Formula
  desc "LLM inference server for one workstation: llama-server API, CUDA or Metal"
  homepage "https://github.com/midagedev/bloomery"
  version "0.3.11"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/midagedev/bloomery/releases/download/v0.3.11/bloomery-0.3.11-macos-arm64-metal.tar.gz"
    sha256 "0b736fc683feb40dd767dda816fd27feae805fa036fc3fe05cbdea2fb8f361ba"
  end

  on_linux do
    on_intel do
      url "https://github.com/midagedev/bloomery/releases/download/v0.3.11/bloomery-0.3.11-linux-x86_64-cuda-sm86.tar.gz"
      sha256 "6dd02c1a9faa2bb91bca9b1cb457c7747ae505695e2e9bf3ff998d9fc0b8bede"
    end
    # The GB10 (DGX Spark) build: sm_121a PTX, runs on a GB10's GPU only.
    on_arm do
      url "https://github.com/midagedev/bloomery/releases/download/v0.3.11/bloomery-0.3.11-linux-aarch64-cuda-sm121a.tar.gz"
      sha256 "481b06a1a7ee8f574811a824dcec4e7cb8f34a8441be0bb774be6b91549f4d57"
    end
  end

  def install
    if OS.mac?
      # prepare is a generic name on PATH, so it installs as bloomery-prepare.
      bin.install "bin/bloomery-serve-metal", "bin/generate_metal"
      bin.install "bin/prepare" => "bloomery-prepare"
    else
      bin.install "bin/bloomery-serve"
    end
  end

  # Neither test touches a GPU or a model file: the Metal server refuses a
  # missing -m by name (exit 64), and the CUDA server's --version prints the
  # crate version and the release's commit.
  test do
    if OS.mac?
      assert_match "-m PATH is required", shell_output("#{bin}/bloomery-serve-metal 2>&1", 64)
    else
      assert_match "bloomery-serve #{version}", shell_output("#{bin}/bloomery-serve --version")
    end
  end
end
