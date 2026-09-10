class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.2.0,5210873191596032"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.2.0-5210873191596032/linux-x64/cli_linux_x64.tar.gz"
      sha256 "d9bfee1ae6e4329562cb87da1f5fc3c886d18594837e73e25c3aae00a49499b9"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.2.0-5210873191596032/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "0a8e61f6548865029c4238b9310c686b7a733db5864cae619656abdf48090594"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
