class ReiGraph < Formula
  desc "Local-first developer memory + DAG execution layer for coding agents"
  homepage "https://github.com/plexideas/rei-graph"
  url "https://github.com/plexideas/rei-graph/releases/download/v0.2.0/rei_cli-0.2.0-py3-none-any.whl"
  sha256 "bd76a3f2bcc26ee50f01cd6861d036739b34b4c50ef677399a98801576df576c"
  version "0.2.0"
  license "MIT"

  depends_on "python@3.12"

  def install
    # python -m venv creates a venv with pip included by default.
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", libexec
    # Homebrew caches downloads as "<sha256>--<wheel_name>.whl".
    # pip rejects the hash prefix as an invalid PEP 427 filename.
    # Copy to a clean name before installing.
    wheel = buildpath/"rei_cli-#{version}-py3-none-any.whl"
    cp cached_download, wheel
    system libexec/"bin/pip", "install", wheel
    bin.install_symlink libexec/"bin/rei"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rei --version")
  end
end
