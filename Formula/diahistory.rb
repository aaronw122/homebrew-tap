class Diahistory < Formula
  desc "Capture and archive Dia browser conversations as local files"
  homepage "https://github.com/aaronw122/diaHistory"
  url "https://github.com/aaronw122/diaHistory/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "c0b29be7df648399f66d72bada22be731ff5579ba0dadbf2397a210984f73ab8"
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
