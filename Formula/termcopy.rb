class Termcopy < Formula
  desc "Fixes copy-paste from terminal apps by unwrapping TUI-inserted line breaks"
  homepage "https://github.com/aaronw122/termcopy"
  url "https://github.com/aaronw122/termcopy/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9d808b9a2cdf4b9fa45a13512630fe490dd5aff80c74459d8779f6b1933cb9aa"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/termCopy" => "termcopy"
  end

  service do
    run [opt_bin/"termcopy"]
    keep_alive true
    log_path var/"log/termcopy.log"
    error_log_path var/"log/termcopy.log"
  end

  test do
    assert_match "termCopy", shell_output("#{bin}/termcopy --test 2>&1", 0)
  end
end
