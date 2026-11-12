cask "tabieum" do
  version "0.4.0"
  sha256 "1efb0eec4ab69661ecad6990bf0755980ad8714e7c1430973586770c55365bc5"

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
