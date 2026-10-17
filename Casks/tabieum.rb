cask "tabieum" do
  version "0.1.0"
  sha256 "e4facc5524cae8adb6352c6c46216b6d53de3124d92499474e5b3da6238638c6"

  url "https://github.com/juhyeonni/tabieum/releases/download/v#{version}/tabieum-#{version}.zip"
  name "tabieum"
  desc "Local-first companion for Apple Notes"
  homepage "https://github.com/juhyeonni/tabieum"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "tabieum.app"

  zap trash: [
    "~/Library/Application Support/dev.juhyeonni.tabieum",
    "~/Library/Preferences/dev.juhyeonni.tabieum.plist",
  ]

  caveats <<~EOS
    tabieum is signed with the developer's own certificate, not by Apple, so macOS asks
    you to confirm the first launch. Either open System Settings > Privacy & Security and
    choose Open Anyway, or run:
      xattr -dr com.apple.quarantine /Applications/tabieum.app
  EOS
end
