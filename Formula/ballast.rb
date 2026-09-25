class Ballast < Formula
  desc "Keep your machine responsive while coding agents work"
  homepage "https://github.com/anur4ag/ballast"
  version "0.1.0-alpha.1"
  license any_of: ["MIT", "Apache-2.0"]
  depends_on macos: :big_sur

  on_arm do
    url "https://github.com/anur4ag/ballast/releases/download/v0.1.0-alpha.1/ballast-0.1.0-alpha.1-aarch64-apple-darwin.tar.gz"
    sha256 "29665b1edaf46d070acdf44f8f8b0bbe45deff07f673512f43dd9131f527d3dc"
  end

  on_intel do
    url "https://github.com/anur4ag/ballast/releases/download/v0.1.0-alpha.1/ballast-0.1.0-alpha.1-x86_64-apple-darwin.tar.gz"
    sha256 "a6b2df8d247909cc5520d82cdeeee7fff1f254ed89a73f25ac176afd476890f5"
  end

  def install
    bin.install "ballast"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      Run `ballast install` once to start the user service and install agent hooks.
      Open Codex /hooks to approve the hooks. Upgrades restart Ballast automatically.
      Before `brew uninstall ballast`, run `ballast uninstall` to remove the service and hooks.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ballast --version")
  end
end
