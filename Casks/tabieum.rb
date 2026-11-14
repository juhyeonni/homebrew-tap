cask "tabieum" do
  version "0.5.1"
  sha256 "e0368ed20848b7f084e3fa29eb5d2c9b3bc6813e23498f04bc651cd2ca4f97aa"

  url "https://github.com/juhyeonni/tabieum/releases/download/v#{version}/Tabieum-#{version}.zip"
  name "tabieum"
  desc "Local-first companion for Apple Notes"
  homepage "https://github.com/juhyeonni/tabieum"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Tabieum.app"

  zap trash: [
    "~/Library/Application Support/dev.juhyeonni.tabieum",
    "~/Library/Preferences/dev.juhyeonni.tabieum.plist",
  ]

  caveats <<~EOS
    tabieum is signed with the developer's own certificate, not by Apple, so macOS asks
    you to confirm the first launch. Either open System Settings > Privacy & Security and
    choose Open Anyway, or run:
      xattr -dr com.apple.quarantine /Applications/Tabieum.app
  EOS
end
