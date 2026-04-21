class ClaudeConnect < Formula
  desc "MCP server that exposes read-only git commands to trusted peers"
  homepage "https://github.com/aaronw122/ClaudeConnect"
  version "0.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.6.0/claude-connect-arm64"
    sha256 "33ec5b5648992d754ac9a060c51b890dce5e267576ea7782e847c87d79930dc3"
  end

  on_intel do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.6.0/claude-connect-x64"
    sha256 "ef14af226579280454074ced0063312f5428121f2c8c4cdf7ac39bde09131bc5"
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
