class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.3,5723946948100096"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.3-5723946948100096/linux-x64/cli_linux_x64.tar.gz"
      sha256 "7a7239a69b65d3cf3af7e75f27b2ff4e9cce696a7b9a9e5c37c695f1c74eec34"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.3-5723946948100096/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "453f9c5530877ab6369e2536e576cfab2bbbcb45923a9bc776678142538e419d"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
