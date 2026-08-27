class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.22,5711547746615296"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.22-5711547746615296/linux-x64/cli_linux_x64.tar.gz"
      sha256 "1e1a219a86e75d7c6351f96d182ca2105302d5c34d8fa9c31265dc0adf24145f"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.22-5711547746615296/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "a68925bc7336eb0b90de1e1aefd44d535f5487b7cf606a76fdb982207aef9a2e"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
