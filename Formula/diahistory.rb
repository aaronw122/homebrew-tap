class Diahistory < Formula
  desc "Capture and archive Dia browser conversations as local files"
  homepage "https://github.com/aaronw122/diaHistory"
  url "https://github.com/aaronw122/diaHistory/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "cd9452061a4b0c9751eb0485f00cbe1c08d19cd235ab433a9e19f0605b2c23f4"
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
