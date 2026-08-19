cask "screenbox" do
  version "1.3.2"
  sha256 "bd95fcf86f57f5a2481a3323ad72e47f7ac172ba4a52b37febb66f09c2a9ec9f"

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
