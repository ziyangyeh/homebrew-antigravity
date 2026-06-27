class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.13,5758107482193920"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.13-5758107482193920/linux-x64/cli_linux_x64.tar.gz"
      sha256 "6bf990458c114af3b3173dcbc1b0fb9ab93bea91c53b605fdd69aedd29a21cd9"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.13-5758107482193920/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "e2f062ff8a573d2da54c03c8f0b66e130a563a08c87b6db174953a9afdd21235"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
