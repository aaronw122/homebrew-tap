class ClaudeConnect < Formula
  desc "MCP server that exposes read-only git commands to trusted peers"
  homepage "https://github.com/aaronw122/ClaudeConnect"
  version "0.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.2.0/claude-connect-arm64"
    sha256 "45b43b277fa1eacdd431aa7484ff831ea1a8e966ee71aa41a197fc0b4b1298a7"
  end

  on_intel do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.2.0/claude-connect-x64"
    sha256 "d0d9b1020996ee1e7607cac4e2a884152a309b978be18087ffd2bfe305ed13b4"
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
