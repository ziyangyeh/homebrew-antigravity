class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.2,5174998495789056"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.2-5174998495789056/linux-x64/cli_linux_x64.tar.gz"
      sha256 "0754010347926daf00c96734cfcf59ee6043eab23efc35b99b2d62aad84dc6f0"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.2-5174998495789056/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "59cf9ec0f5a694fd9cf612262d152857368fdc819db1192bd3fe1219ba26254f"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
