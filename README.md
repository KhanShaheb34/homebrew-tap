# Homebrew tap

Casks for [gg](https://github.com/KhanShaheb34/gg), a small, fast desktop Git client.

```sh
brew install --cask khanshaheb34/tap/gg
```

Newer versions of Homebrew ask you to trust a third-party tap before using it. If the
install is refused for that reason, run `brew trust khanshaheb34/tap` and install again.

gg is not notarized by Apple, so macOS will refuse to open it the first time. Open
**System Settings → Privacy & Security** and choose **Open Anyway** beside the message
about gg, or run `xattr -cr /Applications/gg.app`.

To update: `brew upgrade --cask gg`. To remove: `brew uninstall --cask gg`
(add `--zap` to also remove its settings).
