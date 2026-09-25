class Ballast < Formula
  desc "Keep your machine responsive while coding agents work"
  homepage "https://github.com/anur4ag/ballast"
  version "0.1.0-alpha.2"
  license any_of: ["MIT", "Apache-2.0"]
  depends_on macos: :big_sur

  on_arm do
    url "https://github.com/anur4ag/ballast/releases/download/v0.1.0-alpha.2/ballast-0.1.0-alpha.2-aarch64-apple-darwin.tar.gz"
    sha256 "407874553d72f84f7697bc44de79cdc13a6200ca520b88251e4d3784ed375f53"
  end

  on_intel do
    url "https://github.com/anur4ag/ballast/releases/download/v0.1.0-alpha.2/ballast-0.1.0-alpha.2-x86_64-apple-darwin.tar.gz"
    sha256 "18f6bae5a112d4e43480240e18a65fd77f53cfac8d098a6195219b95ee60a5d4"
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
