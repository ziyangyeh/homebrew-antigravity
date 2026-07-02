class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.15,5090589570629632"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.15-5090589570629632/linux-x64/cli_linux_x64.tar.gz"
      sha256 "d125764f115fa53d77081ef1e2a6fa9b3a3fde8799a0d91d811a4bee4b2b2fb7"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.15-5090589570629632/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "2a816dcced6aefe8f9cc0281a3d9d00af87a8a6f39789f2030e32c92d3e864f6"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
