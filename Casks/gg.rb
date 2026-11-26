cask "gg" do
  version "0.5.0"
  sha256 "56ed459c4f374e02992d72823922d2f031200e41cfa0cc52f9a8d4900a109a3d"

  url "https://github.com/KhanShaheb34/gg/releases/download/v#{version}/gg-macos-universal.dmg"
  name "gg"
  desc "Small, fast desktop Git client with a commit graph and worktrees"
  homepage "https://github.com/KhanShaheb34/gg"

  livecheck do
    url :url
    strategy :github_latest
  end

  # From 0.4.0 gg updates itself (signed updates from its GitHub releases), so a plain
  # "brew upgrade" leaves it alone; "brew upgrade --cask gg" still upgrades it.
  auto_updates true
  depends_on macos: :monterey

  app "gg.app"
  # The gg terminal command: the launcher inside the app, which finds the app by its bundle
  # identifier. gg shows it as installed by Homebrew and leaves it alone.
  binary "#{appdir}/gg.app/Contents/Resources/gg"

  # gg is not notarized (that needs a paid Apple developer account), so macOS would refuse to
  # open the quarantined app. Homebrew has already checked the download against the sha256
  # above; this removes the quarantine flag so gg opens like any other app.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/gg.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.shakirul.gg",
    "~/Library/Caches/com.shakirul.gg",
    "~/Library/WebKit/com.shakirul.gg",
  ]

  caveats <<~EOS
    gg is not notarized by Apple. This cask removes the quarantine flag from
    gg.app after checking the download's sha256, so it opens without the
    "Apple could not verify" message.
  EOS
end
