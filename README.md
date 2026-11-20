# Homebrew tap

Casks for [gg](https://github.com/KhanShaheb34/gg), a small, fast desktop Git client.

```sh
brew install --cask khanshaheb34/tap/gg
```

Newer versions of Homebrew ask you to trust a third-party tap before using it. If the
install is refused for that reason, run `brew trust khanshaheb34/tap` and install again.

gg is not notarized by Apple (that needs a paid Apple developer account), so macOS would
normally refuse to open it the first time. This cask checks the download against its
sha256 and then removes the quarantine flag from `gg.app`, so it opens like any other app.
If you would rather keep macOS's check and approve gg yourself, download the disk image
from the [releases page](https://github.com/KhanShaheb34/gg/releases) instead.

To update: `brew upgrade --cask gg`. To remove: `brew uninstall --cask gg`
(add `--zap` to also remove its settings).
