cask "unirms-monitor" do
  version "1.0.1"
  sha256 "644c6f72af6fe03d7059e49d9135153ae1fcc2be27c47b7b149d06ebd4bab138" # Will be updated when DMG is uploaded

  url "https://github.com/adhiman2409/unirms-monitor/releases/download/v#{version}/UnirmsMonitor-#{version}.dmg"
  name "UNIRMS Activity Monitor"
  desc "Professional activity monitoring solution for UNIRMS"
  homepage "https://github.com/adhiman2409/unirms-monitor"

  app "UnirmsMonitor.app"

  uninstall quit: "com.unirms.activitymonitor",
            delete: [
              "/Applications/UnirmsMonitor.app",
              "/Library/LaunchDaemons/com.unirms.activitymonitor.plist",
              "/Library/LaunchDaemons/com.unirms.activitymonitor.watchdog.plist",
            ]

  zap trash: [
    "~/Library/Application Support/com.unirms.activity.monitor",
    "~/Library/Logs/unirms-activity-monitor.log",
    "~/Library/Logs/unirms-activity-monitor-error.log",
    "~/Library/Logs/unirms-activity-monitor-watchdog.log",
    "~/Library/Logs/unirms-activity-monitor-watchdog-error.log",
    "/Library/Logs/unirms-activity-monitor.log",
    "/Library/Logs/unirms-activity-monitor-error.log",
    "/Library/Logs/unirms-activity-monitor-watchdog.log",
    "/Library/Logs/unirms-activity-monitor-watchdog-error.log",
  ]
end
