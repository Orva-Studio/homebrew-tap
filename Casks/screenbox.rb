cask "screenbox" do
  version "1.3.1"
  sha256 "269e7f682005eeb784db1b1a44dbdd99a82706a603cbb995144c1ce59a889838"

  url "https://github.com/Orva-Studio/screenbox/releases/download/v#{version}/ScreenBox-#{version}.zip",
      verified: "github.com/Orva-Studio/screenbox/"
  name "ScreenBox"
  desc "Draw highlight boxes on screen while recording or presenting"
  homepage "https://github.com/Orva-Studio/screenbox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ScreenBox.app"

  caveats <<~EOS
    ScreenBox is ad-hoc signed, so macOS quarantines it on download. Clear the
    flag before opening it:

      xattr -dr com.apple.quarantine /Applications/ScreenBox.app

    ScreenBox also needs Accessibility permission for its global hotkey:
    System Settings -> Privacy & Security -> Accessibility.
  EOS

  zap trash: [
    "~/Library/Preferences/local.screenbox.plist",
  ]
end
