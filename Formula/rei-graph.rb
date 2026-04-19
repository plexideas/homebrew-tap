class ReiGraph < Formula
  desc "Local-first developer memory + DAG execution layer for coding agents"
  homepage "https://github.com/plexideas/rei-graph"
  url "https://github.com/plexideas/rei-graph/releases/download/v0.1.0/rei_cli-0.1.0-py3-none-any.whl"
  sha256 "70d2c7b4e8aed8c9b9d1b1f13fbddd321f7fbee7becc90bb9698009fbf663564"
  version "0.1.0"
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
