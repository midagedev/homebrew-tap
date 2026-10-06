# frozen_string_literal: true

# Linux x86-64 only: the release embeds sm_86 PTX and AVX2 host kernels; there
# is no macOS build. Inside the tarball the binary sits at
# bloomery-<version>-linux-x86_64-cuda-sm86/bin/bloomery-serve.
class Bloomery < Formula
  desc "LLM inference server for one workstation: llama-server API, CUDA + AVX2"
  homepage "https://github.com/midagedev/bloomery"
  url "https://github.com/midagedev/bloomery/releases/download/v0.2.3/bloomery-0.2.3-linux-x86_64-cuda-sm86.tar.gz"
  version "0.2.3"
  sha256 "a03c6b4a8dcd3347336e53795ed1747fcdb12fc0f9f9ce252eadeb28245128d4"
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
