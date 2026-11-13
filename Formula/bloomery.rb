# frozen_string_literal: true

# One release, three builds: Linux x86-64 (sm_86 PTX and AVX2 host kernels, NVIDIA
# GPUs), Linux arm64 for a GB10 (DGX Spark, sm_121a PTX) and Apple Silicon (the
# Metal backend, macOS 26.2 or newer, signed and notarized). Inside each tarball the binaries sit at
# bloomery-<version>-<platform>/bin/.
class Bloomery < Formula
  desc "LLM inference server for one workstation: llama-server API, CUDA or Metal"
  homepage "https://github.com/midagedev/bloomery"
  version "0.3.14"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/midagedev/bloomery/releases/download/v0.3.14/bloomery-0.3.14-macos-arm64-metal.tar.gz"
    sha256 "20d012df91270d66a2282aacb2147090800a239ebdb954119b5034852231df45"
  end

  on_linux do
    on_intel do
      url "https://github.com/midagedev/bloomery/releases/download/v0.3.14/bloomery-0.3.14-linux-x86_64-cuda-sm86.tar.gz"
      sha256 "d963b33674532b2acd8ba32f01b5c3701be3776738a4b940d1776641041bf5a8"
    end
    # The GB10 (DGX Spark) build: sm_121a PTX, runs on a GB10's GPU only.
    on_arm do
      url "https://github.com/midagedev/bloomery/releases/download/v0.3.14/bloomery-0.3.14-linux-aarch64-cuda-sm121a.tar.gz"
      sha256 "6347314735d741d2cbc34e6dd06a209ba97f1b83bc6190246564f49d2e3110bc"
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
