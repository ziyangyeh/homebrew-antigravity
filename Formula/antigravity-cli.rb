class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.0,4523441756438528"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.0-4523441756438528/linux-x64/cli_linux_x64.tar.gz"
      sha256 "7ee512440af5ed0c819065cd7cc14eec90699214df4be32280ac346f0100577e"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.0-4523441756438528/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "23550a5ae36916b2702c006a47c21aa86fbe3af1ac44f57b5dbd3f9dec5c7e7a"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
