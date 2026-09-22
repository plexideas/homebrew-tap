cask "naro" do
  version "0.5.0"
  sha256 "6583783939281cc46b861370b573c822a07cc09176d204b1d60ce52450df7736"

  url "https://github.com/plexideas/naro/releases/download/v#{version}/Naro-#{version}-13-arm64.zip"
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
