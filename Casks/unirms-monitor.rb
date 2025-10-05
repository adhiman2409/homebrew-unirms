cask "unirms-monitor" do
  version "1.0.2"
  sha256 "057f8f40f5005934d86400073a023397dc8da235ca1015c43f9ff492478eef1c" # Will be updated when DMG is uploaded

  url "https://github.com/adhiman2409/unirms-monitor/releases/download/#{version}/UnirmsMonitor-#{version}.dmg"
  name "UNIRMS Activity Monitor"
  desc "Professional activity monitoring solution for UNIRMS"
  homepage "https://github.com/adhiman2409/unirms-monitor"

  app "UnirmsMonitor.app"

  uninstall launchctl: ["com.unirms.activitymonitor", "com.unirms.activitymonitor.watchdog"],
            quit:      "com.unirms.activitymonitor",
            script:    {
              executable: "/bin/bash",
              args:       ["-c", "rm -f ~/Library/Logs/unirms-activity-monitor*.log"],
            },
            delete:    ["/Applications/UnirmsMonitor.app", "/Library/LaunchDaemons/com.unirms.activitymonitor.plist",
                        "/Library/LaunchDaemons/com.unirms.activitymonitor.watchdog.plist"]

  zap script: {
        executable: "/bin/bash",
        args:       ["-c", "sudo rm -f /Library/Logs/unirms-activity-monitor*.log 2>/dev/null || true"],
      },
      trash:  [
        "/Library/Logs/unirms-activity-monitor-error.log",
        "/Library/Logs/unirms-activity-monitor-watchdog-error.log",
        "/Library/Logs/unirms-activity-monitor-watchdog.log",
        "/Library/Logs/unirms-activity-monitor.log",
        "~/Library/Application Support/com.unirms.activity.monitor",
        "~/Library/Logs/unirms-activity-monitor-error.log",
        "~/Library/Logs/unirms-activity-monitor-watchdog-error.log",
        "~/Library/Logs/unirms-activity-monitor-watchdog.log",
        "~/Library/Logs/unirms-activity-monitor.log",
      ]
end
