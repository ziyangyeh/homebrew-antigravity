class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.11,4956531888881664"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.11-4956531888881664/linux-x64/cli_linux_x64.tar.gz"
      sha256 "caef1dd4c99c57dee1d1dec2b6c67726df535ea49ec71eabadd36daff8223d19"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.11-4956531888881664/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "f3a03713e3e3cc84477e115d3fd9de1c232386b09384ba8690df6fc0cb0abbf3"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
