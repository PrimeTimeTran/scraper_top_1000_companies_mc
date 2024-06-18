## Build a Web Scraper

Use the following to build the scraper.

- Python
- Beautiful Soup

## Create a script to run/start the worker

- Bash

## Define Process
Define the process which'll run the script on the appropriate days.

zed ~/Library/LaunchAgents/scrape_top_1000_companies_job.plist

```sh
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.seepdeep.scrape_top_1000_companies_job</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/src/scraper.sh</string>
    </array>
    <key>StartCalendarInterval</key>
    <array>
        <dict>
            <key>Hour</key>
            <integer>19</integer>
            <key>Minute</key>
            <integer>20</integer>
            <key>Weekday</key>
            <integer>1</integer> <!-- Monday -->
        </dict>
        <dict>
            <key>Hour</key>
            <integer>16</integer>
            <key>Minute</key>
            <integer>25</integer>
            <key>Weekday</key>
            <integer>2</integer> <!-- Tuesday -->
        </dict>
        <dict>
            <key>Hour</key>
            <integer>16</integer>
            <key>Minute</key>
            <integer>25</integer>
            <key>Weekday</key>
            <integer>3</integer> <!-- Wednesday -->
        </dict>
        <dict>
            <key>Hour</key>
            <integer>16</integer>
            <key>Minute</key>
            <integer>25</integer>
            <key>Weekday</key>
            <integer>4</integer> <!-- Thursday -->
        </dict>
        <dict>
            <key>Hour</key>
            <integer>16</integer>
            <key>Minute</key>
            <integer>25</integer>
            <key>Weekday</key>
            <integer>5</integer> <!-- Friday -->
        </dict>
    </array>
    <key>StandardOutPath</key>
    <string>/Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/tmp/logs/daily.log</string>
    <key>StandardErrorPath</key>
    <string>/Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/tmp/logs/error.log</string>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```

## Grant Permissions to scripts

chmod +x scraper.sh collect_data.py parse_pages.py save_data.py

## Schedule Daemon on host machine

launchctl load ~/Library/LaunchAgents/scrape_top_1000_companies_job.plist

## Confirm Job Scheduled
launchctl list | grep seepdeep

## Updating Daemon

- Unload Daemon
launchctl unload ~/Library/LaunchAgents/scrape_top_1000_companies_job.plist

- Makes changes
zed ~/Library/LaunchAgents/scrape_top_1000_companies_job.plist

- Reload Daemon
launchctl load ~/Library/LaunchAgents/scrape_top_1000_companies_job.plist

## Add logging

/Users/future/Documents/Work/\_Main/.Projects/top_1000_companies_scraper/tmp/logs
