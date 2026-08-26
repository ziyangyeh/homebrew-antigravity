class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.1.21,6424454201475072"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.21-6424454201475072/linux-x64/cli_linux_x64.tar.gz"
      sha256 "4806a347119d36be6d8ab5cc3f03319bc6aa8407a8d9203de7976a42954cabde"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.1.21-6424454201475072/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "8626b97aec1ef96abdabd234c0b8259a2fdf2a3f3918c927641f8c821342d5e4"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
