# frozen_string_literal: true

# One release, three builds: Linux x86-64 (sm_86 PTX and AVX2 host kernels, NVIDIA
# GPUs), Linux arm64 for a GB10 (DGX Spark, sm_121a PTX) and Apple Silicon (the
# Metal backend, macOS 26.2 or newer, signed and notarized). Inside each tarball the binaries sit at
# bloomery-<version>-<platform>/bin/.
class Bloomery < Formula
  desc "LLM inference server for one workstation: llama-server API, CUDA or Metal"
  homepage "https://github.com/midagedev/bloomery"
  version "0.3.13"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/midagedev/bloomery/releases/download/v0.3.13/bloomery-0.3.13-macos-arm64-metal.tar.gz"
    sha256 "463d9f9812041b73861a102b3cf9898757b3232d65f5cf6a8fdf844105369923"
  end

  on_linux do
    on_intel do
      url "https://github.com/midagedev/bloomery/releases/download/v0.3.13/bloomery-0.3.13-linux-x86_64-cuda-sm86.tar.gz"
      sha256 "2d5e1100957f2933b56d84a02db9023d8da4e8ce34c3eab6a4bbca48f76c00ba"
    end
    # The GB10 (DGX Spark) build: sm_121a PTX, runs on a GB10's GPU only.
    on_arm do
      url "https://github.com/midagedev/bloomery/releases/download/v0.3.13/bloomery-0.3.13-linux-aarch64-cuda-sm121a.tar.gz"
      sha256 "4bed49e0af84e31f50ed9fbb0f43bac61ada8ed33fc4d45a9c9160bf5f4c53bf"
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
