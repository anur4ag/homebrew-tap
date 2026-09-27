class Ballast < Formula
  desc "Keep your machine responsive while coding agents work"
  homepage "https://github.com/anur4ag/ballast"
  version "0.1.0-alpha.4"
  license any_of: ["MIT", "Apache-2.0"]
  depends_on macos: :big_sur

  on_arm do
    url "https://github.com/anur4ag/ballast/releases/download/v0.1.0-alpha.4/ballast-0.1.0-alpha.4-aarch64-apple-darwin.tar.gz"
    sha256 "3b3769fa53c7c66b84d06fe88597f94d70b7ba82f84c327b7935df0da271fa4e"
  end

  on_intel do
    url "https://github.com/anur4ag/ballast/releases/download/v0.1.0-alpha.4/ballast-0.1.0-alpha.4-x86_64-apple-darwin.tar.gz"
    sha256 "1a2fa058df5e0da4fe4fc44d84551f281472df8dba927296b5bfcd531319e4fa"
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
