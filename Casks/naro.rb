cask "naro" do
  version "0.5.3"
  sha256 "39bdd1a0d1fe1fcbbd0dedabbf8d0decba26016d572962a48603eb67626b8b44"

  url "https://github.com/plexideas/naro/releases/download/v#{version}/Naro-#{version}-16-arm64.zip"
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
