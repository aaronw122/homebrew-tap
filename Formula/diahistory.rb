class Diahistory < Formula
  desc "Capture and archive Dia browser conversations as local files"
  homepage "https://github.com/aaronw122/diaHistory"
  url "https://github.com/aaronw122/diaHistory/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "2928143aef169ee143a2cf0c45ef975075ab909d92e1f00ce446b8fe05db01a4"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "codesign", "--force", "--sign", "-",
           "--identifier", "com.diahistory.agent",
           ".build/release/diahistory"
    bin.install ".build/release/diahistory"
  end

  test do
    assert_match "Capture Dia browser chat conversations via the Accessibility API.",
                 shell_output("#{bin}/diahistory --help")
  end
end
