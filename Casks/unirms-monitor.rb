cask "unirms-monitor" do
  version "1.0.4"
  sha256 "8ba66de6dd2e16ea5bfb24035b43f2669166b4929e6855c87ff4fd94a4fe7d76" # Will be updated when DMG is uploaded

  url "https://github.com/adhiman2409/unirms-monitor/releases/download/#{version}/UnirmsMonitor-#{version}.dmg"
  name "UNIRMS Activity Monitor"
  desc "Professional activity monitoring solution for UNIRMS"
  homepage "https://github.com/adhiman2409/unirms-monitor"

  app "UnirmsMonitor.app"

  postflight do
    system_command "/bin/cp",
                   args: ["#{staged_path}/com.unirms.activitymonitor.plist", "/Library/LaunchDaemons/"],
                   sudo: true
    system_command "/bin/cp",
                   args: ["#{staged_path}/com.unirms.activitymonitor.watchdog.plist", "/Library/LaunchDaemons/"],
                   sudo: true
    system_command "/bin/launchctl",
                   args: ["load", "/Library/LaunchDaemons/com.unirms.activitymonitor.plist"],
                   sudo: true
    system_command "/bin/launchctl",
                   args: ["load", "/Library/LaunchDaemons/com.unirms.activitymonitor.watchdog.plist"],
                   sudo: true
  end

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
