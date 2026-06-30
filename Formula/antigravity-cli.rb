class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.14,6049473256882176"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.14-6049473256882176/linux-x64/cli_linux_x64.tar.gz"
      sha256 "7170d598193ee0addcaba7d8c3a2c2e307ae8622dacf749831128bd1ad3ca458"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.14-6049473256882176/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "992653b4de4fe667ee5bd66ca259edd6b88b308f20a31880a77002624204e277"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
