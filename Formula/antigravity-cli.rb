class AntigravityCli < Formula
  desc "Terminal interface for Antigravity agents"
  homepage "https://antigravity.google/product/antigravity-cli"
  version "1.0.9,6003845613092864"
  license :cannot_represent

  depends_on :linux

  on_linux do
    on_intel do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.9-6003845613092864/linux-x64/cli_linux_x64.tar.gz"
      sha256 "cd80f85f43b52b389d7b498d6784f8316d57a9cc62eae23d840c5de368f9c4d5"
    end

    on_arm do
      url "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.9-6003845613092864/linux-arm/cli_linux_arm64.tar.gz"
      sha256 "944d67056b7cc6e4411dca84d9f077b1e460c8cd2a4432d2cdf219421ff73e5a"
    end
  end

  def install
    bin.install "antigravity" => "agy"
  end

  test do
    assert_match version.to_s.split(",").first, shell_output("#{bin}/agy --version")
  end
end
