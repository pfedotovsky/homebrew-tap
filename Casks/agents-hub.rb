cask "agents-hub" do
  version "0.1.5"
  sha256 "7c8b5e7096b6046264b747fd150b29bc96bf0cae523d26318373c51fad5d64aa"

  url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/v#{version}/Agents.Hub_#{version}_universal.dmg"
  name "Agents Hub"
  desc "Control coding agents running on remote CloudCLI hosts"
  homepage "https://github.com/pfedotovsky/agents-fleet-hub"

  app "Agents Hub.app"

  caveats <<~EOS
    Agents Hub is not notarized yet. If macOS refuses to open the app,
    clear the quarantine flag:
      xattr -dr com.apple.quarantine "/Applications/Agents Hub.app"
  EOS

  zap trash: [
    "~/Library/Application Support/io.github.pfedotovsky.agents-hub",
    "~/Library/Caches/io.github.pfedotovsky.agents-hub",
    "~/Library/WebKit/io.github.pfedotovsky.agents-hub",
    "~/Library/Preferences/io.github.pfedotovsky.agents-hub.plist",
    "~/Library/Saved Application State/io.github.pfedotovsky.agents-hub.savedState",
  ]
end
