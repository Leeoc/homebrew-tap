cask "devrings" do
  version "0.1.0"
  sha256 "4bd8712d89d452264f2aedcc6df71d8752a88cc89fa05f72a06d003ad489bd79"

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
