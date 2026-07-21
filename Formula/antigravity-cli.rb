class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.5,5958982624477184"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.5-5958982624477184/linux-x64/cli_linux_x64.tar.gz"
      sha256 "1d586501b8a13d146e8aa3c7f00634f50c6034e2c428ea7d013377d36315a69a"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.5-5958982624477184/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "d61ace663d7efee9dfd8f4f881e6f1021eff904a0688a91cd4d84359ee76f044"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
