class FleetServer < Formula
  desc "Single-binary agent host server for Agents Hub (fork of CloudCLI UI server)"
  homepage "https://github.com/pfedotovsky/agents-fleet-hub"
  version "0.1.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-darwin-arm64.tar.gz"
      sha256 "cfd2467122a5145518e99f310569e23a43c9074d1717e1dcccb6ec5d08b39b48"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-x64.tar.gz"
      sha256 "9d00eb5d288dcf75813f0fcc46ee8d2993453748ebe300b4d8e8b23019b213a3"
    end
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-arm64.tar.gz"
      sha256 "2c276d87c554b7d2daf6bb46c9c2d67b804257a045bb75154f1e059aaa93de76"
    end
  end

  def install
    bin.install "fleet-server"
    doc.install "LICENSE", "NOTICE", "THIRD-PARTY-NOTICES.md"
  end

  def caveats
    <<~EOS
      Optional: install ripgrep to enable session search:
        brew install ripgrep

      Start on port 3011 (data in ~/.fleet-server):
        brew services start fleet-server
      Then add http://<host>:3011 as a host in Agents Hub.
    EOS
  end

  service do
    run [opt_bin/"fleet-server"]
    keep_alive true
    environment_variables SERVER_PORT: "3011"
    log_path var/"log/fleet-server.log"
    error_log_path var/"log/fleet-server.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fleet-server version")
  end
end
