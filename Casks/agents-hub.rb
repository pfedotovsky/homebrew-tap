cask "agents-hub" do
  version "0.1.0"
  sha256 "6332c0a581ab196e595b19fab7cbd6676cdba0a44d8d6dc5306842e952a08750"

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
