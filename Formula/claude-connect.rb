class ClaudeConnect < Formula
  desc "MCP server that exposes read-only git commands to trusted peers"
  homepage "https://github.com/aaronw122/ClaudeConnect"
  version "0.5.0"
  license "MIT"

  on_arm do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.5.0/claude-connect-arm64"
    sha256 "40b0fe1f6e5fc8e4f3af5fcc55acd9bf2489b80bff9f4aa06e2955784ac13c14"
  end

  on_intel do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.5.0/claude-connect-x64"
    sha256 "dca03d225660da61e1cc8c8cc97e259bee43fa08809a4ef31a25c47bc9ef79d5"
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
