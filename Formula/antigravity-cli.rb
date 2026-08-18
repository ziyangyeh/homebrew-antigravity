class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.14,6392696810635264"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.14-6392696810635264/linux-x64/cli_linux_x64.tar.gz"
      sha256 "345692ba5dfa201b0fe4b360c2d8e9bc6abf44b59221f190f8a6fd775b78daae"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.14-6392696810635264/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "89f537d62dd853b27e419d463dbbea5b17972c6307a12f03f81b88408fd8256f"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
