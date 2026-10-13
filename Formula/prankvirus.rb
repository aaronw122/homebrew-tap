class Prankvirus < Formula
  desc "Glitch or shift the whole Mac screen with a hotkey, no Screen Recording needed"
  homepage "https://github.com/aaronw122/prankvirus"
  url "https://github.com/aaronw122/prankvirus/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "bec87f7c5a5e72dcc3995816485c52afbd6b0843ab5b8c631cd619f1424e098b"
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
    # app after it exits normally, so `prankvirus stop` could not turn it off.
    keep_alive crashed: true
    log_path var/"log/prankvirus.log"
    error_log_path var/"log/prankvirus.log"
  end

  def caveats
    <<~EOS
      Check both hotkeys work on this Mac (press each one when asked):
        prankvirus check

      Start it in the background, now and at every login:
        prankvirus start        effects stay on until their hotkey is pressed again
        prankvirus start -30    each effect turns itself off after 30 minutes (decimals work: -1.5)

      Control-Option-Command-G  glitch: the screen shakes and splits into colour copies
      Control-Option-Command-S  shift: the whole screen slides to the right
      Press the same hotkey again to stop.

      No menu bar icon and no permission prompts.

      To turn it off, now and at login:
        prankvirus stop

      Log: #{var}/log/prankvirus.log
    EOS
  end

  test do
    assert_predicate bin/"prankvirus", :executable?
  end
end
