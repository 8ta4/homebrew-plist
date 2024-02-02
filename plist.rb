# frozen_string_literal: true

# This class represents a Homebrew formula for the plist project.
class Plist < Formula
  version '0.1.0'
  url 'https://github.com/8ta4/plist/releases/download/v0.1.0/plist.tar.gz'
  sha256 '6b13fb9a4c22750d5bf7f14943db1450e55a0037a6ff9c2cb3d4c22fd739adc2'

  depends_on 'fswatch'
  depends_on 'node'
  depends_on 'yq'

  def install
    bin.install 'plist'
    libexec.install Dir['*']
    bin.env_script_all_files(libexec, SCRIPT_DIRECTORY: libexec)
  end
end
