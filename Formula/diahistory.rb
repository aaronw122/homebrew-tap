class Diahistory < Formula
  desc "Capture and archive Dia browser conversations as local files"
  homepage "https://github.com/aaronw122/diaHistory"
  url "https://github.com/aaronw122/diaHistory/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0de2d35bbd882ac1f8664edd85834265813695fd8208fd2d63de2ff84e819e34"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/diahistory"
  end

  def caveats
    <<~EOS
      diahistory installed successfully.

      Next step:
        diahistory --install

      To use a custom archive directory:
        diahistory --output ~/MyChats --install
    EOS
  end

  test do
    assert_match "Capture Dia browser chat conversations via the Accessibility API.",
                 shell_output("#{bin}/diahistory --help")
  end
end
