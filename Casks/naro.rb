cask "naro" do
  version "0.5.4"
  sha256 "1e207510ce8706a0c8f0c23ba1827a62fdd50a5d1cd9f3270494228290dcefe3"

  url "https://github.com/plexideas/naro/releases/download/v#{version}/Naro-#{version}-17-arm64.zip"
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
