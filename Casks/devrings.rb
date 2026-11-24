cask "devrings" do
  version "0.2.0"
  sha256 "153826381d20962435e7a22b974089f0719cc6b95174461d60d086397de83906"

  url "https://github.com/Leeoc/devrings/releases/download/v#{version}/DevRings-#{version}.zip"
  name "DevRings"
  desc "Menu bar rings for shipping, reviewing and moving tickets"
  homepage "https://github.com/Leeoc/devrings"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "DevRings.app"

  # DevRings is signed ad hoc, not notarised, so Gatekeeper would block the downloaded copy.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/DevRings.app"]
  end

  uninstall quit: "com.leeoconnell.devrings"

  zap trash: [
    "~/Library/Application Support/DevRings",
    "~/Library/Preferences/com.leeoconnell.devrings.plist",
  ]
end
