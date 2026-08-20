cask "screenbox" do
  version "1.4.0"
  sha256 "5c2bc82f1f72bbfbf126ea34dbed5d39b5bb784146e9dd22bfffaaefd5997e36"

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

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/ScreenBox.app"]
  end

  caveats <<~EOS
    ScreenBox needs Accessibility permission for its global hotkey:
    System Settings -> Privacy & Security -> Accessibility.
  EOS

  zap trash: [
    "~/Library/Preferences/local.screenbox.plist",
  ]
end
