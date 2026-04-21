class ClaudeConnect < Formula
  desc "MCP server that exposes read-only git commands to trusted peers"
  homepage "https://github.com/aaronw122/ClaudeConnect"
  version "0.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.4.0/claude-connect-arm64"
    sha256 "299662eedd6807867fc35255e16c13518f66105d93c67399dd45934e14538b5c"
  end

  on_intel do
    url "https://github.com/aaronw122/ClaudeConnect/releases/download/v0.4.0/claude-connect-x64"
    sha256 "55a09d211bc38f99b1506dfeb76ab2b21b08c76366c8be95753fe5f914c9f85e"
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
