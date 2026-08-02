class Harnfig < Formula
  desc "Declaratively install Agent Skills from GitHub"
  homepage "https://github.com/pfedotovsky/harnfig"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pfedotovsky/harnfig/releases/download/v0.1.0/harnfig-v0.1.0-osx-arm64.tar.gz"
      sha256 "b13cc867fd665772d72ed6051f55c1e5c629c53dd84a5c535829bd8af65e1dbd"
    else
      url "https://github.com/pfedotovsky/harnfig/releases/download/v0.1.0/harnfig-v0.1.0-osx-x64.tar.gz"
      sha256 "297ce099db323fe6b15b0375b8e6f1ec9c20252d32aa1aabaede598a4dfa2f03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pfedotovsky/harnfig/releases/download/v0.1.0/harnfig-v0.1.0-linux-arm64.tar.gz"
      sha256 "efcf9c933ce5f7c89199297bbbed1a703e15eb3c4b28c8d0976cb27864869d5d"
    else
      url "https://github.com/pfedotovsky/harnfig/releases/download/v0.1.0/harnfig-v0.1.0-linux-x64.tar.gz"
      sha256 "2f7e6c722397ab1465117c4f8003c8e758db40254977db4302c8cf152a11d00a"
    end
  end

  def install
    bin.install "harnfig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harnfig version")
  end
end
