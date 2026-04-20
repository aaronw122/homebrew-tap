class Diahistory < Formula
  desc "Capture and archive Dia browser conversations as local files"
  homepage "https://github.com/aaronw122/diaHistory"
  url "https://github.com/aaronw122/diaHistory/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "51b724cea639a9aea81692698d7e7f0e4ad7d4dbd510f9205366be56a38884dd"
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
