cask "naro" do
  version "0.5.1"
  sha256 "086695b91860e6df9c5a26129ca4264a16e226155fdecdfc9d72dbe875356f00"

  url "https://github.com/plexideas/naro/releases/download/v#{version}/Naro-#{version}-14-arm64.zip"
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
