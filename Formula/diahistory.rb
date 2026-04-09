class Diahistory < Formula
  desc "Capture and archive Dia browser conversations as local files"
  homepage "https://github.com/aaronw122/diaHistory"
  url "https://github.com/aaronw122/diaHistory/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "74aa7cc700e9fb8debac989c2317a9442f076b3b53656d544f73488ee7d9214a"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/diahistory"
  end

  test do
    assert_match "Capture Dia browser chat conversations via the Accessibility API.",
                 shell_output("#{bin}/diahistory --help")
  end
end
