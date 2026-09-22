cask "naro" do
  version "0.5.2"
  sha256 "79c0bc7257d8aa9f70db1a7d971177d48f001edada5a314987dbc8d4f9ea3989"

  url "https://github.com/plexideas/naro/releases/download/v#{version}/Naro-#{version}-15-arm64.zip"
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
