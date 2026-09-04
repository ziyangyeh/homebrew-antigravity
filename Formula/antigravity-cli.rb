class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.26,5550154686791680"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.26-5550154686791680/linux-x64/cli_linux_x64.tar.gz"
      sha256 "c47c0726266b3513660b7094bceceecbd03d8ae907786aa269c507ceb7e4ee54"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.26-5550154686791680/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "f595d2f1ae23001afffab9cb9012d054f0e8a02a1e848537f73239ae8d3fbd6d"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
