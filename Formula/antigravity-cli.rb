class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.2.1,5123043593420800"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.2.1-5123043593420800/linux-x64/cli_linux_x64.tar.gz"
      sha256 "6a2c53db6c681fc114f9a1e499e7b4771357ab2852242e56acbd43197d4807f9"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.2.1-5123043593420800/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "882d9160972d09a721422baa554999ad969bc9b3fa680e866a981398f937f19f"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
