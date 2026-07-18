class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.4,6277569641840640"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.4-6277569641840640/linux-x64/cli_linux_x64.tar.gz"
      sha256 "aaab42e395cb4e3bfe5ae88994a340865d949f7a9e7f0604ffa2a3f1e8aadbfa"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.4-6277569641840640/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "333199327cc29e21cb8fcc4e19f7c02c462bf41dd876f1328d64e9922c631700"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
