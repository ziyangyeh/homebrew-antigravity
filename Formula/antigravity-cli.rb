class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.16,4893150192467968"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.16-4893150192467968/linux-x64/cli_linux_x64.tar.gz"
      sha256 "8ffc887002920b1b4ab42f6213f50a21aa7bb4ee14caa0ed563129a2ce39135d"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.16-4893150192467968/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "a66ae3e75e024c03aa79d6618ef8199a0a71ae0f43b9e5ee9e930a589ba0ca2f"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
