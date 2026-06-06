class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.6,6458082025406464"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.6-6458082025406464/linux-x64/cli_linux_x64.tar.gz"
      sha256 "3eae552781d3054b782142e3cfe7be73e3bd068c736a432ca6f1adaa40f19e07"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.6-6458082025406464/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "be6303d4b891a79457ca6ed169aff2efd3ceb694354634e85ef58c883bae6739"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
