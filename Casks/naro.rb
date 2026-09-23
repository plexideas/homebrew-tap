cask "naro" do
  version "0.6.0"
  sha256 "f691fed1820c30e036652e6c38f0b73c04c8fedf93559b01a253619d0071a787"

  url "https://github.com/plexideas/naro/releases/download/v#{version}/Naro-#{version}-19-arm64.zip"
  name "Naro"
  desc "Open Office files in Google editors and sync changes locally"
  homepage "https://github.com/plexideas/naro"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Naro.app"

  uninstall quit: "app.naro.native"
end
