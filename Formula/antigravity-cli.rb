class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.18,6435547766456320"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.18-6435547766456320/linux-x64/cli_linux_x64.tar.gz"
      sha256 "1aa7e3c1f5ba02372d24ba2f99ed015c7135016becc7dcbb18bf8332f513a818"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.18-6435547766456320/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "1639d0ea2c3bbd0e68621d70f8222641724b0871afc2f8798dda27cb84217e69"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
