class ReiGraph < Formula
  desc "Local-first developer memory + DAG execution layer for coding agents"
  homepage "https://github.com/plexideas/rei-graph"
  url "https://github.com/plexideas/rei-graph/releases/download/v0.2.2/rei_cli-0.2.2-py3-none-any.whl"
  sha256 "990718b9109418635c3e011efd7dc724e6a15889f02dc22777737aed173e64bb"
  version "0.2.2"
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

    # cryptography's Rust extension ships with @rpath dylib IDs and minimal
    # Mach-O header padding. Homebrew's relocation step fails when the absolute
    # opt-prefix path is longer than the available header space. Fix: change
    # @rpath/... IDs to @loader_path/basename so Homebrew's fixup skips them.
    # Python loads extensions via dlopen(absolute_path, ...) and ignores the ID.
    Dir["#{libexec}/**/*.so"].each do |f|
      id = `otool -D #{f.shellescape} 2>/dev/null`.lines.last&.strip.to_s
      next unless id.start_with?("@rpath/")

      new_id = "@loader_path/#{File.basename(id.delete_prefix("@rpath/"))}"
      system "install_name_tool", "-id", new_id, f
    end

    bin.install_symlink libexec/"bin/rei"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rei --version")
  end
end
