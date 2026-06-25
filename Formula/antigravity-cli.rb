class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.12,6156052174077952"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.12-6156052174077952/linux-x64/cli_linux_x64.tar.gz"
      sha256 "7e3075df68ebad58aa1cf42231e9d8b83bf2895b5b058ab1736b0b6383c75008"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.12-6156052174077952/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "a0367e5875ac1b88a6c0b163c86ebd5d13c9bef907f4469a6516ff69021bf2d4"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
