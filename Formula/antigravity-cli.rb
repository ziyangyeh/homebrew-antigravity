class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.11,6118976565149696"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.11-6118976565149696/linux-x64/cli_linux_x64.tar.gz"
      sha256 "ee9ee33b3e0b80768ea5b18458ccde84a9d35f0b99083dcc2fef83d5a312c01a"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.11-6118976565149696/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "a36d87f3624be58a7d945c5cd62104206607adc3422f5bd68c986cacbd698ae7"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
