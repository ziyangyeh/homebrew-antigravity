# Homebrew Antigravity

Linux Homebrew tap for Google Antigravity CLI.

## Install

```sh
brew tap ziyangyeh/antigravity
brew install antigravity-cli
```

Or install directly:

```sh
brew install ziyangyeh/antigravity/antigravity-cli
```

This installs the upstream `antigravity` binary as:

```sh
agy
```


## Install Location

Homebrew installs the real files under its prefix. On this machine, the prefix is:

```sh
/home/linuxbrew/.linuxbrew
```

After installation, the runnable command is linked at:

```sh
/home/linuxbrew/.linuxbrew/bin/agy
```

The versioned Cellar path is:

```sh
/home/linuxbrew/.linuxbrew/Cellar/antigravity-cli/<version>/bin/agy
```

## Update Formula

The update script uses Google's official Unix installer as the source of truth:

```sh
./scripts/update-formula.sh
```

It downloads `https://antigravity.google/cli/install.sh`, extracts the release server base URL from the script, reads the Linux manifests, downloads the tarballs, computes Homebrew `sha256` values, and rewrites `Formula/antigravity-cli.rb`.

## Notes

This tap is Linux-only. The official macOS cask is available from `homebrew/cask`:

```sh
brew install --cask antigravity-cli
```
