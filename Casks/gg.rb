cask "gg" do
  version "0.3.0"
  sha256 "c50f6291dcb0c4ea44d13f081297f902589e13cb58de009437192c2ead4065a5"

  url "https://github.com/KhanShaheb34/gg/releases/download/v#{version}/gg-macos-universal.dmg"
  name "gg"
  desc "Small, fast desktop Git client with a commit graph and worktrees"
  homepage "https://github.com/KhanShaheb34/gg"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "gg.app"

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
