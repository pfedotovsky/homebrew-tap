class FleetServer < Formula
  desc "Single-binary agent host server for Agents Hub (fork of CloudCLI UI server)"
  homepage "https://github.com/pfedotovsky/agents-fleet-hub"
  version "0.1.8"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-darwin-arm64.tar.gz"
      sha256 "2eb0d59524bec04a202428cc6ea1a408eedfd87e863a8f873043c780ddd726f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-x64.tar.gz"
      sha256 "3038634a1e3e10762bfd150710dfa93c519d28a254a8894e173d94373c46d16c"
    end
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-arm64.tar.gz"
      sha256 "63decfd85b8aeb5ad8ea7c0cd98a37e87028e0359a30a7b6c4cfa8678d49f8bf"
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
