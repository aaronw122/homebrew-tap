class Prankvirus < Formula
  desc "Glitch or shift the whole Mac screen with a hotkey, no Screen Recording needed"
  homepage "https://github.com/aaronw122/prankvirus"
  url "https://github.com/aaronw122/prankvirus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "943315f9bd3bb2c06912afb9e7a8f5136e07a14522ebba0beafc86e1200bb8f3"
  license "MIT"

  # Deliberately no `depends_on xcode`: XcodeRequirement refuses machines that
  # have only the Command Line Tools, and CLT is enough to build this.
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/prankvirus"
  end

  service do
    run [opt_bin/"prankvirus"]
    # `crashed:` and not `true`: with `keep_alive true` launchd would respawn the
    # app after the menu's Quit, so the documented off switches would stop working.
    keep_alive crashed: true
    log_path var/"log/prankvirus.log"
    error_log_path var/"log/prankvirus.log"
  end

  def caveats
    <<~EOS
      Start it, now and at every login:
        brew services start prankvirus

      Control-Option-Command-A  glitch: the screen shakes and splits into colour copies
      Control-Option-Command-S  shift: the whole screen slides to the right
      Press the same hotkey again to stop. Each effect also stops after 30 seconds.

      No permission prompts: it never asks for Screen Recording or Accessibility.

      If AsciiVisor is installed, stop it first; both use Control-Option-Command-A:
        brew services stop asciivisor

      To remove it, now and at login:
        brew services stop prankvirus

      Log: #{var}/log/prankvirus.log
    EOS
  end

  test do
    assert_predicate bin/"prankvirus", :executable?
  end
end
