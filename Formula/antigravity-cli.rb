class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.6,6535449645285376"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.6-6535449645285376/linux-x64/cli_linux_x64.tar.gz"
      sha256 "2448b9bb1d3496063a6335d021dcab90c42d71fdaad6346ef8a395f0ca0fe9d0"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.6-6535449645285376/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "78040d87f4fef72bb785af68cf7d9d6c25024710ee58f8281f85c3f1e47b975a"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
