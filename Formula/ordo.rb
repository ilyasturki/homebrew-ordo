class Ordo < Formula
  desc "Terminal-first, single-user project planning tool"
  homepage "https://github.com/ilyasturki/ordo"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-arm64"
      sha256 "0b3caeec78ca58e8617f1ec9878fb876ea5828044505ba011f05e2feec53f6dd"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-x64"
      sha256 "024eee2887b55462cd08a6ac0ec46c63e34beb38c1a6e39b42a3a7bb190f157e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-arm64"
      sha256 "53f469fea247c612a819f407094c6872b301c9e0a0e9ecee2e6f050fe7f2b898"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-x64"
      sha256 "00dce07d1e1499a926361c1e0fa27214749d6be49c9570d3eacbc38475155c58"
    end
  end

  def install
    binary = Dir.glob("ordo-*").first
    chmod 0755, binary
    bin.install binary => "ordo"
    generate_completions_from_executable(bin/"ordo", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ordo --version")
  end
end
