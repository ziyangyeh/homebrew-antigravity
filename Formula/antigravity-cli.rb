class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.15,5350383476932608"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.15-5350383476932608/linux-x64/cli_linux_x64.tar.gz"
      sha256 "d0b1d6f3678a061915caebc431930e240b863bf4059369c08c6ffceb24e66b5f"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.15-5350383476932608/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "5be066db6673faaec233e8cdb3f494aea3f30d8bf21a5fe0d6cf19451d83b7c6"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
