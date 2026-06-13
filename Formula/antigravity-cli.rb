class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.8,5963827121094656"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.8-5963827121094656/linux-x64/cli_linux_x64.tar.gz"
      sha256 "db8ca9d3c8cce0651e72b6fffa8374e2799c5554d94df2b1f9e42bb515745bff"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.8-5963827121094656/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "cdbc51ffcd8a2b94991fd36c866fb0855cfaed1e2ef0ab1fcf3be7b64a3f9f71"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
