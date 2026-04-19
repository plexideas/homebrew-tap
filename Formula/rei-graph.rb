class ReiGraph < Formula
  include Language::Python::Virtualenv

  desc "Local-first developer memory + DAG execution layer for coding agents"
  homepage "https://github.com/plexideas/rei-graph"
  url "https://github.com/plexideas/rei-graph/releases/download/v0.1.0/rei_cli-0.1.0-py3-none-any.whl"
  sha256 "70d2c7b4e8aed8c9b9d1b1f13fbddd321f7fbee7becc90bb9698009fbf663564"
  version "0.1.0"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Create an isolated virtualenv and install the pre-built wheel.
    # The wheel already contains the compiled TypeScript ingester — no
    # Node.js runtime is required.
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", cached_download
    bin.install_symlink libexec/"bin/rei"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rei --version")
  end
end
