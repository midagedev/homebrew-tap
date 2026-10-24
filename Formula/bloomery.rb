# frozen_string_literal: true

# Linux x86-64 only: the release embeds sm_86 PTX and AVX2 host kernels; there
# is no macOS build. Inside the tarball the binary sits at
# bloomery-<version>-linux-x86_64-cuda-sm86/bin/bloomery-serve.
class Bloomery < Formula
  desc "LLM inference server for one workstation: llama-server API, CUDA + AVX2"
  homepage "https://github.com/midagedev/bloomery"
  url "https://github.com/midagedev/bloomery/releases/download/v0.3.9/bloomery-0.3.9-linux-x86_64-cuda-sm86.tar.gz"
  version "0.3.9"
  sha256 "af43eee9fdaf9f7a846eb9e8625cff6360ec9f8ca10eaa10e7cfa0714536f0b5"
  license "MIT"

  depends_on :linux
  depends_on arch: :x86_64

  def install
    bin.install "bloomery-#{version}-linux-x86_64-cuda-sm86/bin/bloomery-serve"
  end

  # --version prints the crate version and the release's commit; it touches no
  # GPU, so the test runs on machines without a driver too.
  test do
    assert_match "bloomery-serve #{version}", shell_output("#{bin}/bloomery-serve --version")
  end
end
