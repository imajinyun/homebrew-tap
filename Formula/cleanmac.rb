class Cleanmac < Formula
  include Language::Python::Virtualenv

  desc "macOS cleanup CLI with dry-run and safety guardrails"
  homepage "https://github.com/imajinyun/cleanmac"
  url "https://github.com/imajinyun/cleanmac/archive/091b30afd9791eee4d871db7951e5a630adcc66a.tar.gz"
  version "0.1.0"
  sha256 "0848ea0fc30886f7a69d0aab419d4be2c742de59d65da86b20dd2864b2a42a8d"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/cleanmac --json capabilities")
    assert_match "cleanmac.capabilities.v1", output
  end
end
