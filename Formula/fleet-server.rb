class FleetServer < Formula
  desc "Single-binary agent host server for Agents Hub (fork of CloudCLI UI server)"
  homepage "https://github.com/pfedotovsky/agents-fleet-hub"
  version "0.3.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-darwin-arm64.tar.gz"
      sha256 "8bfb96c9bab99befa5dff226dd13911cc7ed293a767e36be70ee0d4aaea63f05"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-x64.tar.gz"
      sha256 "a3675582a1ce13f5dc39a7caeb1416e00aa4e627cfbf30e02f10072f9644c492"
    end
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-arm64.tar.gz"
      sha256 "f330d9a995a71ad03312481f4c1b1343f60ae6f8d32e967e51a51fc3fb6f4bb5"
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

      For remote access, create the host login locally:
        fleet-server auth setup

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
