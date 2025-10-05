cask "unirms-monitor" do
  version "1.0.0"
  sha256 "388f2f3b65b2d896d46d4c39626e4fb9b57f5fbd9ee0ce954c89c356dcedaa1e" # Will be updated when DMG is uploaded

  url "https://github.com/adhiman2409/gomicroutils/releases/download/v#{version}/UNIRMS_Activity_Monitor_Installer.dmg"
  name "UNIRMS Activity Monitor"
  desc "Professional activity monitoring solution for UNIRMS"
  homepage "https://github.com/adhiman2409/gomicroutils"

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
