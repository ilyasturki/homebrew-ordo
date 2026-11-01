class Ordo < Formula
  desc "Terminal-first, single-user project planning tool"
  homepage "https://github.com/ilyasturki/ordo"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-arm64"
      sha256 "466af77dc20379c9aa1b03a77545390b003ead637d522778abe8ed08111c3934"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-x64"
      sha256 "e280a38e6a3d8ce8325f8de8cccfc378ce4a851f03a38d459d6b66eaa3e1418e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-arm64"
      sha256 "6159e699e875053b04156eed1609ae5efe6236baf301f17570cf8e38772b8cae"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-x64"
      sha256 "e5f83fa3a6c1e78b9fa4ffc9a3b50b5a97d554a5b6d4e62a4df2085c6e5c5d79"
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
