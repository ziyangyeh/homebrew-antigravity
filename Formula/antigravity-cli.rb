class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.7,5436940900761600"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.7-5436940900761600/linux-x64/cli_linux_x64.tar.gz"
      sha256 "f5bb465edb938212eb0a185d68c420ff5b78f08c72de5a6d88dfefaf7af17074"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.7-5436940900761600/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "400a48e67723e41f1ff2c84705fc8866c5822c4fab21d4b72fe7dbaf120b2114"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
