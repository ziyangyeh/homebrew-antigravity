class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.1,6269367663591424"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.1-6269367663591424/linux-x64/cli_linux_x64.tar.gz"
      sha256 "2ee167841cdc9a1d7dc5a624f1f15b84ee5dbb94b85af662a7299118cb4b1586"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.1-6269367663591424/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "3fc542686c5c82d7a01e3796a8bfcda5ed849c6e70f07d4d0c93e51368952784"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
