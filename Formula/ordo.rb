class Ordo < Formula
  desc "Terminal-first, single-user project planning tool"
  homepage "https://github.com/ilyasturki/ordo"
  version "0.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-arm64"
      sha256 "880b7882dc63b77de0b176fcffd1c3a4c8da5f8126c40b2cea38dff79153f2c6"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-darwin-x64"
      sha256 "1bdd4f82672a31dd71705f7317a0ceddb951f189ee119b23779020e60ce6e04c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-arm64"
      sha256 "f9a07c7ad2073441458c51ae484603991f4fab0df87954a4f4eb5ed82c7fe7c3"
    end
    on_intel do
      url "https://github.com/ilyasturki/ordo/releases/download/v#{version}/ordo-linux-x64"
      sha256 "cd2750c869a8f4de32197f09b354076d83087765c6204897d299e6f538e13823"
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
