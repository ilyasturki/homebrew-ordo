class Ordo < Formula
  desc "Terminal-first, single-user project planning tool"
  homepage "https://github.com/ilyasturki/ordo"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-arm64"
      sha256 "021d5760ef2ad4ca48ec20355bd3bf57555b9dcf903344098118d87da63ddf40"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-x64"
      sha256 "60259e3a3870950cca2fda6d36cd6e50c8c43abc7539c6666ab8f9b85455afdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-arm64"
      sha256 "908064296d613ac00180be9d2ad61078a64c191ca5110d7d611a6a121cd969ce"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-x64"
      sha256 "509a73ab9beedd67e8a91f05cb1f00235fad89e026ec64398774559256b02b0a"
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
