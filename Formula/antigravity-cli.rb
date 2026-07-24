class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.7,5951805767680000"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.7-5951805767680000/linux-x64/cli_linux_x64.tar.gz"
      sha256 "946cd06258d0ede72d0311550c914315798821f6a397f53ac760919826a19af4"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.7-5951805767680000/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "0d6d488851745e80e69b8935d063e742945811b47111994b1a6dbd27df3010d5"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
