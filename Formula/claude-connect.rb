class ClaudeConnect < Formula
  desc "MCP server that exposes read-only git commands to trusted peers"
  homepage "https://github.com/aaronw122/ClaudeConnect"
  version "0.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.3.0/claude-connect-arm64"
    sha256 "f4c773d4e75e6f82edeaa96186c084fb5a2c5f0a7eae6a57bc9101ab71c8d7a6"
  end

  on_intel do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.3.0/claude-connect-x64"
    sha256 "7e5abd276c96df736eb90d482d3d57d8d8876996827b3d729a11a5eb237b1c62"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "claude-connect-arm64" => "claude-connect"
    else
      bin.install "claude-connect-x64" => "claude-connect"
    end
  end

  test do
    assert_match "Usage: claude-connect", shell_output("#{bin}/claude-connect --help 2>&1")
  end
end
