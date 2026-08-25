class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.20,5830032204103680"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.20-5830032204103680/linux-x64/cli_linux_x64.tar.gz"
      sha256 "6ceeb0ac91df6dca60a4fa02856807ed2e2fc6d3d70bb734d1ad61a9e44ef4da"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.20-5830032204103680/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "a2f5c205e9c1c89bfcf714f485a08c63b1a5d907f98226191e7b5a177e0368a9"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
