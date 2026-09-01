class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.23,6260551186251776"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.23-6260551186251776/linux-x64/cli_linux_x64.tar.gz"
      sha256 "379693509ca4d68d74f75def6c95996739aa6c1dc38b120c399035c108f1a39a"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.23-6260551186251776/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "cbf2299514468eb31b9ccce7b89a0a011dc6497894c199c06f6b771cc9848a67"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
