# typed: false
# frozen_string_literal: true

class Scry < Formula
  desc "Renamed to gadak"
  homepage "https://github.com/midagedev/gadak"
  url "https://github.com/midagedev/gadak/archive/refs/tags/v0.11.0.tar.gz"
  version "0.11.0"
  sha256 "effb18663c5210f8fe540d255a5688d32eb259c172f6c088e7ce3a25c0b35045"
  license "Apache-2.0"

  deprecate! date: "2026-08-13", because: "renamed to midagedev/tap/gadak"

  def install
    odie <<~EOS
      scry was renamed to gadak.

        brew uninstall --force scry
        brew install midagedev/tap/gadak
    EOS
  end
end
