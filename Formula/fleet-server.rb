class FleetServer < Formula
  desc "Single-binary agent host server for Agents Hub (fork of CloudCLI UI server)"
  homepage "https://github.com/pfedotovsky/agents-fleet-hub"
  version "0.3.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-darwin-arm64.tar.gz"
      sha256 "9f0a4fe5e7cb640d09bdb2725ec715b9161622d47ab69e1e1dba51276290bd68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-x64.tar.gz"
      sha256 "3d0278a4e68593d94bd49680a82a47450ab6a502564e85c8b49c5d019a3798bf"
    end
    on_arm do
      url "https://github.com/pfedotovsky/agents-fleet-hub/releases/download/server-v#{version}/fleet-server-#{version}-linux-arm64.tar.gz"
      sha256 "37ddaed214775116700fc41ec3f75c019fe0b10b78d09ffd37886e1f4509e7c6"
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
