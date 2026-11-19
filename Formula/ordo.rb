class Ordo < Formula
  desc "Terminal-first, single-user project planning tool"
  homepage "https://github.com/ilyasturki/ordo"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-arm64"
      sha256 "4c6dd2bdbb5b9a611cb694d0d04c1b760d80e63e875619c645189a144582b444"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-x64"
      sha256 "d81a9d645875bdcd7a7ceebda5f659f0b8e702b52d56182fd440f9f5af490c5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-arm64"
      sha256 "7030b2c333abaf251337119754e66062709a51e7a81d42608689eed30eaaecb1"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-x64"
      sha256 "a12a5e13da61c6d10eb5b2fde47f2f04787e0325478f789e17a2efc5604e0c6f"
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
