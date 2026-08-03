class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.10,6423386432339968"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.10-6423386432339968/linux-x64/cli_linux_x64.tar.gz"
      sha256 "9e94cfffa869ee2bf9ab32e05eff3baa4661b66d5e00a2fd40a8c5dc6f9bd450"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.10-6423386432339968/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "4308f85b1dd4f6b5654ea5f7a0962a482f33acf8169b2e6ac4aecdb209d13411"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
