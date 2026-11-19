cask "gg" do
  version "0.3.0"
  sha256 "bc1862475c7c1ea7e9df1ef12129698d590719e714b6031fe2945982adfb31f9"

  url "https://gg.shakirul.com/download/gg-macos-universal.dmg",
      verified: "gg.shakirul.com/download/"
  name "gg"
  desc "Small, fast desktop Git client with a commit graph and worktrees"
  homepage "https://github.com/KhanShaheb34/gg"

  livecheck do
    url "https://gg.shakirul.com/latest.json"
    strategy :json do |json|
      json["version"]
    end
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
