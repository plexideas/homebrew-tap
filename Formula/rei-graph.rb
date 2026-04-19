class ReiGraph < Formula
  desc "Local-first developer memory + DAG execution layer for coding agents"
  homepage "https://github.com/plexideas/rei-graph"
  url "https://github.com/plexideas/rei-graph/releases/download/v0.2.5/rei_cli-0.2.5-py3-none-any.whl"
  sha256 "3c6d9ccfd85a4fafe29305c22ebf6dd38c50c817c0a3cc00570215aaf9d21fce"
  version "0.2.5"
  license "MIT"

  depends_on "python@3.12"

  # Rust-compiled Python extensions (cryptography, pydantic-core, rpds) ship
  # with @rpath/... dylib IDs and minimal Mach-O header padding. Homebrew's
  # dylib_id_for() would rewrite these to absolute opt-prefix paths whose
  # length exceeds what fits in the header, producing "Updated load commands
  # do not fit" errors. preserve_rpath tells Homebrew to leave @rpath IDs
  # unchanged. Python extension modules are loaded via dlopen(absolute_path)
  # so the dylib ID is never used for resolution at runtime.
  preserve_rpath

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
