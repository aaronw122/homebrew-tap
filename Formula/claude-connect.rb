class ClaudeConnect < Formula
  desc "MCP server that exposes read-only git commands to trusted peers"
  homepage "https://github.com/aaronw122/ClaudeConnect"
  url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.1.0/claude-connect"
  sha256 "dd299346f670f2dc1ca951debd7a3db089758f3dd5a11d7b29a5d15dda5aa990"
  version "0.1.0"
  license "MIT"

  def install
    bin.install "claude-connect"
  end

  test do
    assert_match "Usage: claude-connect", shell_output("#{bin}/claude-connect 2>&1", 0)
  end
end
