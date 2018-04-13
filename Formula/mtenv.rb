class Mtenv < Formula
  desc "Version manager for Myst language v0.0.3"
  homepage "https://github.com/myst-lang/mtenv"
  url "https://github.com/myst-lang/mtenv/archive/v0.0.3.tar.gz"
  sha256 "9aa92ce50d737f1dfddc59f3be08852171cde9b4acded7e510613aad37aed43f"

  depends_on "crystal-lang" => :build

  def install
    # Install the executable binary
    system "shards", "build", "--production"
    bin.install "bin/mtenv"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test mtenv`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/mtenv"
  end
end
