#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FORMULA="$ROOT_DIR/Formula/antigravity-cli.rb"
INSTALL_SH_URL="https://antigravity.google/cli/install.sh"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "error: missing required command: $1" >&2
    exit 1
  fi
}

need curl
need ruby
need sha256sum

install_sh="$tmpdir/install.sh"
curl -fsSL "$INSTALL_SH_URL" -o "$install_sh"

download_base_url="$(
  ruby -ne 'if /^DOWNLOAD_BASE_URL="([^"]+)"/ =~ $_; puts $1; exit; end' "$install_sh"
)"

if [[ -z "$download_base_url" ]]; then
  echo "error: could not find DOWNLOAD_BASE_URL in $INSTALL_SH_URL" >&2
  exit 1
fi

manifest_value() {
  ruby -rjson -e 'payload = JSON.parse(STDIN.read); puts payload.fetch(ARGV.fetch(0))' "$1"
}

fetch_manifest() {
  local platform="$1"
  curl -fsSL "$download_base_url/manifests/$platform.json"
}

x64_manifest="$(fetch_manifest linux_amd64)"
arm64_manifest="$(fetch_manifest linux_arm64)"

x64_version="$(printf '%s' "$x64_manifest" | manifest_value version)"
x64_url="$(printf '%s' "$x64_manifest" | manifest_value url)"
arm64_version="$(printf '%s' "$arm64_manifest" | manifest_value version)"
arm64_url="$(printf '%s' "$arm64_manifest" | manifest_value url)"

if [[ "$x64_version" != "$arm64_version" ]]; then
  echo "error: manifest versions differ: x64=$x64_version arm64=$arm64_version" >&2
  exit 1
fi

execution_id="$(
  ruby -e 'url = ARGV.fetch(0); match = url.match(%r{/antigravity-cli/[^-]+-([^/]+)/}); abort "could not parse execution id from #{url}" unless match; puts match[1]' "$x64_url"
)"

version="$x64_version,$execution_id"
current_version="$(ruby -ne 'if /^  version "([^"]+)"/ =~ $_; puts $1; exit; end' "$FORMULA")"

if [[ "${FORCE_UPDATE:-0}" != "1" && "$current_version" == "$version" ]]; then
  echo "Formula/antigravity-cli.rb is already up to date at $version"
  exit 0
fi

x64_tar="$tmpdir/cli_linux_x64.tar.gz"
arm64_tar="$tmpdir/cli_linux_arm64.tar.gz"

curl -fL "$x64_url" -o "$x64_tar"
curl -fL "$arm64_url" -o "$arm64_tar"

x64_sha256="$(sha256sum "$x64_tar" | awk '{print $1}')"
arm64_sha256="$(sha256sum "$arm64_tar" | awk '{print $1}')"

ruby - "$FORMULA" "$version" "$x64_url" "$x64_sha256" "$arm64_url" "$arm64_sha256" <<'RUBY'
path, version, x64_url, x64_sha256, arm64_url, arm64_sha256 = ARGV
File.write(path, <<~FORMULA)
  class AntigravityCli < Formula
    desc "Terminal interface for Antigravity agents"
    homepage "https://antigravity.google/product/antigravity-cli"
    version "#{version}"
    license :cannot_represent

    depends_on :linux

    on_linux do
      on_intel do
        url "#{x64_url}"
        sha256 "#{x64_sha256}"
      end

      on_arm do
        url "#{arm64_url}"
        sha256 "#{arm64_sha256}"
      end
    end

    def install
      bin.install "antigravity" => "agy"
    end

    test do
      assert_match version.to_s.split(",").first, shell_output("\#{bin}/agy --version")
    end
  end
FORMULA
RUBY

echo "Updated Formula/antigravity-cli.rb to $version"
