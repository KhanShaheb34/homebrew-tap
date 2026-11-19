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

  zap trash: [
    "~/Library/Application Support/com.shakirul.gg",
    "~/Library/Caches/com.shakirul.gg",
    "~/Library/WebKit/com.shakirul.gg",
  ]

  caveats <<~EOS
    gg is not notarized by Apple, so macOS will refuse to open it the first time.
    Open System Settings → Privacy & Security and choose Open Anyway beside the
    message about gg, or run:

      xattr -cr /Applications/gg.app
  EOS
end
