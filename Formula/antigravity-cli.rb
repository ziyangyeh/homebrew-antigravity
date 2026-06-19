class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.10,6349723456634880"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.10-6349723456634880/linux-x64/cli_linux_x64.tar.gz"
      sha256 "6547cf9a37227f26004fa4b805418b1df96f54c57b9723ca7d10864d2610bb0f"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.10-6349723456634880/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "4674fabc3681221e54c90d15077c9a97a25ea71222001dabe44bf1576e888593"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
