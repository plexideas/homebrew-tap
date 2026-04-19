class ReiGraph < Formula
  desc "Local-first developer memory + DAG execution layer for coding agents"
  homepage "https://github.com/plexideas/rei-graph"
  url "https://github.com/plexideas/rei-graph/releases/download/v0.1.1/rei_cli-0.1.1-py3-none-any.whl"
  sha256 "c290392f63eca0be52de4e58522ad19f27e56761a199d8a61bb167c593924236"
  version "0.1.1"
  license "MIT"

  depends_on "python@3.12"

  def install
    # python -m venv (without --without-pip) creates a venv that includes pip.
    # The wheel is self-contained: rei_core/rei_storage/rei_mcp are bundled
    # inside it, so pip only needs to fetch click, rich, pydantic, neo4j, mcp
    # from PyPI.
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", libexec
    system libexec/"bin/pip", "install", cached_download
    bin.install_symlink libexec/"bin/rei"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rei --version")
  end
end
