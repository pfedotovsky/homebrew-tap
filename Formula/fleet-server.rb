class FleetServer < Formula
  desc "Single-binary agent host server for Agents Hub (fork of CloudCLI UI server)"
  homepage "https://github.com/pfedotovsky/agents-fleet-hub"
  version "0.1.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-darwin-arm64.tar.gz"
      sha256 "946d367d6adf48cfffc3e3ce7b87dbd4d0918ee2a89cc4455977462035737d64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-x64.tar.gz"
      sha256 "3b57fcdf7ea10c7b29538ac5a5092d2d2236cd8899f866581d650826b9043912"
    end
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-arm64.tar.gz"
      sha256 "bb9b7c69fa46166798a899a0312e636f31f509d6bc979d5871946ec527f90b49"
    end
  end

  recommends "ripgrep" # enables session search

  def install
    bin.install "fleet-server"
    doc.install "LICENSE", "NOTICE", "THIRD-PARTY-NOTICES.md"
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
