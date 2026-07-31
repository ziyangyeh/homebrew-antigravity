class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.9,6572839516635136"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.9-6572839516635136/linux-x64/cli_linux_x64.tar.gz"
      sha256 "467809635ef00660497607111547e80a0a863c6e8fce43b507cd1ba6bf6ddd66"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.9-6572839516635136/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "deeb815d07a656074482b2e428ffd9794a2fffbf5df2056e9bf75936b85ebb49"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
