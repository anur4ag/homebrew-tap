class Ballast < Formula
  desc "Keep your machine responsive while coding agents work"
  homepage "https://github.com/anur4ag/ballast"
  version "0.1.0-alpha.3"
  license any_of: ["MIT", "Apache-2.0"]
  depends_on macos: :big_sur

  on_arm do
    url "https://github.com/anur4ag/ballast/releases/download/v0.1.0-alpha.3/ballast-0.1.0-alpha.3-aarch64-apple-darwin.tar.gz"
    sha256 "e30dcf26318c7014a133d371a952e3db7a4c0f220b783c27aceadb58c64cbb3e"
  end

  on_intel do
    url "https://github.com/anur4ag/ballast/releases/download/v0.1.0-alpha.3/ballast-0.1.0-alpha.3-x86_64-apple-darwin.tar.gz"
    sha256 "c57cbc53c50c6341729124309206c743f5fe54af28b65c4479249258fccb901d"
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
