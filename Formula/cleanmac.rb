class Cleanmac < Formula
  include Language::Python::Virtualenv

  desc "macOS cleanup CLI with dry-run and safety guardrails"
  homepage "https://github.com/imajinyun/cleanmac"
  url "https://github.com/imajinyun/cleanmac/archive/091b30afd9791eee4d871db7951e5a630adcc66a.tar.gz"
  version "0.1.0"
  sha256 "0848ea0fc30886f7a69d0aab419d4be2c742de59d65da86b20dd2864b2a42a8d"
  license "MIT"
  head "https://github.com/imajinyun/cleanmac.git", branch: "main"

  depends_on :macos
  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      🧹 cleanmac is a macOS cleanup CLI that previews cleanup work by default.

      🚀 Useful commands:
        cleanmac --json capabilities                         # Show machine-readable capabilities
        cleanmac clean list                                  # List cleanup categories
        cleanmac --json clean inspect --categories trash --limit 10
        cleanmac --json plan --categories trash --max-items 10

      🛡️  Destructive cleanup requires explicit execution flags in cleanmac itself.
    EOS
  end

  test do
    output = shell_output("#{bin}/cleanmac --json capabilities")
    assert_match "cleanmac.capabilities.v1", output
    assert_match "cleanmac", shell_output("#{bin}/cleanmac --help")
  end
end
