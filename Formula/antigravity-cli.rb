class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.25,6680093607723008"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.25-6680093607723008/linux-x64/cli_linux_x64.tar.gz"
      sha256 "45ab4a99884de17af76565a4ff8d9762d6e960067bd008fde9b050ec8fc9e421"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.25-6680093607723008/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "063063128d62f7fa8ff8a01f9629744cb48ec1edcb2c57112d89a79fe48479f7"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
