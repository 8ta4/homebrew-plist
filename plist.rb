# frozen_string_literal: true

# This class represents a Homebrew formula for the plist project.
class Plist < Formula
  version '0.1.1'
  url "https://github.com/8ta4/plist/releases/download/v#{version}/plist.tar.gz"
  sha256 'c5843a39dc26fe78800bcc55405bbb1115908633250aed00a81dcdc944730e29'

  depends_on 'fswatch'
  depends_on 'node'
  depends_on 'yq'

  def install
    bin.install 'plist'
    libexec.install Dir['*']
    bin.env_script_all_files(libexec, SCRIPT_DIRECTORY: libexec)
  end
end
