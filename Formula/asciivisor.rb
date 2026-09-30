class Asciivisor < Formula
  desc "Make your Mac screen look like it is glitching, toggled by a global hotkey"
  homepage "https://github.com/aaronw122/asciivisor"
  url "https://github.com/aaronw122/asciivisor/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "307405720c5eb47aae64cfc320db7699ea8dded33767700a794b732480e3cd58"
  license "MIT"

  # Deliberately no `depends_on xcode`: XcodeRequirement refuses machines that
  # have only the Command Line Tools, and CLT is enough to build this.
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/AsciiVisor"
    # Resolved at runtime as <binary>/../share/asciivisor/Shaders.
    pkgshare.install "Shaders"
  end

  service do
    run [opt_bin/"AsciiVisor"]
    # `crashed:` and not `true`: with `keep_alive true` launchd would respawn the
    # app after the menu's Quit, so the documented off switches would stop working.
    keep_alive crashed: true
    log_path var/"log/asciivisor.log"
    error_log_path var/"log/asciivisor.log"
  end

  def caveats
    <<~EOS
      Start it with:
        brew services start asciivisor

      Do not launch AsciiVisor from a terminal. macOS would attach the Screen
      Recording permission to your terminal instead of to AsciiVisor.

      It needs Screen Recording permission before it can show anything. Approve
      the prompt, or switch on AsciiVisor under
        System Settings -> Privacy & Security -> Screen & System Audio Recording
      then run:
        brew services restart asciivisor

      Control-Option-Command-A turns the effect on, and off again.
      An eye icon in the menu bar has the other shaders.

      To remove it, now and at login:
        brew services stop asciivisor

      After `brew upgrade`, macOS sees a newly built binary and drops the Screen
      Recording grant. Switch AsciiVisor back on in System Settings.

      Log: #{var}/log/asciivisor.log
    EOS
  end

  test do
    assert_path_exists pkgshare/"Shaders/common.metal"
    assert_match "fragmentShader", (pkgshare/"Shaders/03-shaky.metal").read
  end
end
