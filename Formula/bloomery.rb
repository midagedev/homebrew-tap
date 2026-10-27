# frozen_string_literal: true

# One release, two builds: Linux x86-64 (sm_86 PTX and AVX2 host kernels, NVIDIA
# GPUs) and Apple Silicon (the Metal backend, macOS 26.2 or newer, signed and
# notarized). Inside each tarball the binaries sit at
# bloomery-<version>-<platform>/bin/.
class Bloomery < Formula
  desc "LLM inference server for one workstation: llama-server API, CUDA or Metal"
  homepage "https://github.com/midagedev/bloomery"
  version "0.3.10"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/midagedev/bloomery/releases/download/v0.3.10/bloomery-0.3.10-macos-arm64-metal.tar.gz"
    sha256 "d4e0b3a929fd0f7a36e32d3420f3b3fabbd175d5e74c119ac31a96e4fd8f99b7"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/midagedev/bloomery/releases/download/v0.3.10/bloomery-0.3.10-linux-x86_64-cuda-sm86.tar.gz"
    sha256 "d357efb8df5ec8ee25446cb072288fa14be00c06213279f27b80ba75843638ff"
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
