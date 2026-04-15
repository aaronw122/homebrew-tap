class ClaudeConnect < Formula
  desc "MCP server that exposes read-only git commands to trusted peers"
  homepage "https://github.com/aaronw122/ClaudeConnect"
  url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.1.1/claude-connect"
  sha256 "b055619b570b6e60d4bacb459993cd11683c6bb3e52382a135e2ca207e252393"
  version "0.1.1"
  license "MIT"

  def install
    bin.install "claude-connect"
  end

  test do
    assert_match "Usage: claude-connect", shell_output("#{bin}/claude-connect 2>&1", 0)
  end
end
