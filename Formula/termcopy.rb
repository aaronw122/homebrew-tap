class Termcopy < Formula
  desc "Fixes copy-paste from terminal apps by unwrapping TUI-inserted line breaks"
  homepage "https://github.com/aaronw122/termcopy"
  url "https://github.com/aaronw122/termcopy/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "21b03983c1f2aa3a1b26cc52ce69b7e6a6ffeac882242e2e129015cb3d6ba377"
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
