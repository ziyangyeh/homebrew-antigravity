class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.17,5084709148033024"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.17-5084709148033024/linux-x64/cli_linux_x64.tar.gz"
      sha256 "15443966494cd62938320900acfd16df906cf4da56279e4dd8f4846c09f849df"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.17-5084709148033024/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "28822f4ba6d5914064dcab3a1b953b2d10e1c9fc938178c478911b5f0b5b06a4"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
