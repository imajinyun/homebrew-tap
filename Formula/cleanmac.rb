class Cleanmac < Formula
  include Language::Python::Virtualenv

  desc "macOS cleanup CLI with dry-run and safety guardrails"
  homepage "https://github.com/imajinyun/cleanmac"
  url "https://github.com/imajinyun/cleanmac.git", branch: "main"
  version "0.1.0"
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
