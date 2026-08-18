cask "screenbox" do
  version "1.3.0"
  sha256 "289aa0fa22c71cae3db09fd50f107b5cb2542ad1eaf251204ad1710a0296d2fd"

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
    ScreenBox is ad-hoc signed, so macOS quarantines it on download. Either
    install with

      brew install --cask --no-quarantine screenbox

    or clear the flag afterwards:

      xattr -dr com.apple.quarantine /Applications/ScreenBox.app

    ScreenBox also needs Accessibility permission for its global hotkey:
    System Settings -> Privacy & Security -> Accessibility.
  EOS

  zap trash: [
    "~/Library/Preferences/local.screenbox.plist",
  ]
end
