cask "appgate-sdp-client" do
  version "5.2.1"
  sha256 "8f32357c7c8a9a1a17a89af6d5244aa82f88275659fe93dabcfb2a4df51272f9"

  # bin.appgate-sdp.com/ was verified as official when first introduced to the cask
  url "https://bin.appgate-sdp.com/#{version.major_minor}/client/AppGate-SDP-#{version}-Installer.dmg"
  appcast "https://www.appgate.com/software-defined-perimeter/support/appgate-sdp-v#{version.major}-#{version.minor}"
  name "AppGate SDP Client for macOS"
  homepage "https://www.appgate.com/software-defined-perimeter/support"

  depends_on macos: ">= :el_capitan"

  pkg "AppGate SDP Installer.pkg"

  uninstall launchctl: [
    "com.cyxtera.appgate.sdp.client.agent",
    "com.cyxtera.appgate.sdp.helper",
    "com.cyxtera.appgate.sdp.tun",
    "com.cyxtera.appgate.sdp.updater",
  ],
            quit:      [
              "com.cyxtera.appgate.helper",
              "com.cyxtera.appgate.sdp",
            ],
            signal:    [
              ["QUIT", "com.cyxtera.appgate"],
            ],
            pkgutil:   "com.appgate.pkg.appgatetun.component"

  zap trash: [
    "~/Library/Application Support/appgate-ui",
    "~/Library/Caches/com.cyxtera.appgate.sdp.uninstall",
    "~/Library/Preferences/com.cyxtera.appgate.sdp*",
    "~/Library/Saved Application State/com.cyxtera.appgate.sdp.savedState",
  ]
end
