class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.19,4894004681244672"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.19-4894004681244672/linux-x64/cli_linux_x64.tar.gz"
      sha256 "a02132a7c6c647ef0ad483ecbe767619adf6b660a5589cba5c937b0c83909b97"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.19-4894004681244672/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "15bd9959ec0c08bcbfee94b376f02bd8b552dcf17a539bcd210a443fb82443cb"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
