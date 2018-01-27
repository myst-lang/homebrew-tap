class MystLangAT030 < Formula
  desc "The Myst programming language, v0.3.0 (Dec 28, 2017)"
  homepage "https://github.com/myst-lang/myst"
  url "https://github.com/myst-lang/myst/archive/v0.3.0.tar.gz"
  sha256 "8029dbd01b726f5ea01fedbbdfe0e0ce617e5d78d3f265d0805f1929bfc73965"

  depends_on "crystal-lang" => :build

  def install
    # Install the executable binary
    system "crystal", "build", "./src/myst.cr"
    bin.install "myst"
    # Install the interpreter source for clients to interact with.
    prefix.install "src"
    # Install the standard library
    prefix.install "stdlib"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test myst-lang`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/myst"
  end
end
