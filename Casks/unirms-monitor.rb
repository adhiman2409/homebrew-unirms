cask "unirms-monitor" do
  version "1.0.1"
  sha256 "644c6f72af6fe03d7059e49d9135153ae1fcc2be27c47b7b149d06ebd4bab138" # Will be updated when DMG is uploaded

  url "https://github.com/adhiman2409/unirms-monitor/releases/download/#{version}/UnirmsMonitor-#{version}.dmg"
  name "UNIRMS Activity Monitor"
  desc "Professional activity monitoring solution for UNIRMS"
  homepage "https://github.com/adhiman2409/unirms-monitor"

  app "UnirmsMonitor.app"

  uninstall quit:   "com.unirms.activitymonitor",
            launchctl: [
              "com.unirms.activitymonitor",
              "com.unirms.activitymonitor.watchdog",
            ],
            delete: [
              "/Applications/UnirmsMonitor.app",
              "/Library/LaunchDaemons/com.unirms.activitymonitor.plist",
              "/Library/LaunchDaemons/com.unirms.activitymonitor.watchdog.plist",
            ],
            script: {
              executable: "/bin/bash",
              args:       ["-c", "rm -f ~/Library/Logs/unirms-activity-monitor*.log"],
            }

  zap trash: [
    "/Library/Logs/unirms-activity-monitor-error.log",
    "/Library/Logs/unirms-activity-monitor-watchdog-error.log",
    "/Library/Logs/unirms-activity-monitor-watchdog.log",
    "/Library/Logs/unirms-activity-monitor.log",
    "~/Library/Application Support/com.unirms.activity.monitor",
    "~/Library/Logs/unirms-activity-monitor-error.log",
    "~/Library/Logs/unirms-activity-monitor-watchdog-error.log",
    "~/Library/Logs/unirms-activity-monitor-watchdog.log",
    "~/Library/Logs/unirms-activity-monitor.log",
  ],
      script: {
        executable: "/bin/bash",
        args:       ["-c", "sudo rm -f /Library/Logs/unirms-activity-monitor*.log 2>/dev/null || true"],
      }
end
