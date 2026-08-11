class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.12,5877618327814144"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.12-5877618327814144/linux-x64/cli_linux_x64.tar.gz"
      sha256 "c778ae4fd11e5dc2dbddfd7108ee1974ae60fd531afb246be41c6e4bb49c81ca"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.12-5877618327814144/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "dbfcc9bb91716d68410d99027892d34cf412dae1d23b82e191549a8629ddab38"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
