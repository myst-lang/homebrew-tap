class MystLang < Formula
  desc "The Myst programming language, v0.4.0 (Jan 27, 2018)"
  homepage "https://github.com/myst-lang/myst"
  url "https://github.com/myst-lang/myst/archive/v0.4.0.tar.gz"
  sha256 "246b5180dec977f4795d4ea013e0d44f4100421cf1e04acec6bf4a9c7cc25e59"

  depends_on "crystal-lang" => :build

  def install
    # Install the executable binary
    system "crystal", "build", "./src/myst.cr", "--release"
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
