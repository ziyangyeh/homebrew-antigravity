class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.2.2,6061403484848128"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.2.2-6061403484848128/linux-x64/cli_linux_x64.tar.gz"
      sha256 "2cfa5c9a4a1edd96db6d4058f34970be60d3bcacda866e2bdce6aefb2451b48e"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.2.2-6061403484848128/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "00fc5cb50cd714b81cdf1298fcc90e63a59e3e564a4f8076454ab8457d36e6eb"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
