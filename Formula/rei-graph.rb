class ReiGraph < Formula
  desc "Local-first developer memory + DAG execution layer for coding agents"
  homepage "https://github.com/plexideas/rei-graph"
  url "https://github.com/plexideas/rei-graph/releases/download/v0.1.1/rei_cli-0.1.1-py3-none-any.whl"
  sha256 "c290392f63eca0be52de4e5852ad19f27e56761a199d8ac1bb167c593924236"
  version "0.1.1"
  license "MIT"

  depends_on "python@3.12"

  def install
    # python -m venv creates a venv that includes pip by default.
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", libexec
    # Homebrew caches downloads with a hash-prefixed filename that pip rejects
    # as an invalid PEP 427 wheel filename. Copy to a clean name first.
    wheel = buildpath/"rei_cli-#{version}-py3-none-any.whl"
    cp cached_download, wheel
    system libexec/"bin/pip", "install", wheel
    bin.install_symlink libexec/"bin/rei"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rei --version")
  end
end
