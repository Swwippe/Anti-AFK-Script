# Anti-AFK

Swipe Anti-AFK is a FiveM script designed to automatically detect and kick players who are AFK (away from keyboard) for too long. It helps keep your server active by removing idle players and notifying your Discord server when someone is kicked for being AFK.

## Features
- Configurable maximum idle time (in minutes)
- Optional warning before kicking, with a configurable countdown (in seconds)
- Sends a Discord webhook notification when a player is kicked for being AFK
- Debug mode for easy testing

## Configuration
Edit the `config.lua` file to customize the script:

- `Config.MaxAFKMinutes`: How many minutes a player can be idle before being considered AFK.
- `Config.WarnBeforeKick`: If `true`, players will receive a warning before being kicked.
- `Config.WarningDuration`: How many seconds the player has to move after being warned before being kicked.
- `Config.Debug`: (Optional) Enable debug mode for testing (uncomment in `config.lua`).

## How It Works
1. The script tracks player activity (movement and key presses).
2. If a player is idle for longer than `Config.MaxAFKMinutes`, they are either warned or kicked immediately, depending on your config.
3. If warned, the player has `Config.WarningDuration` seconds to move or press a key, or they will be kicked.
4. When a player is kicked, a message is sent to your Discord webhook.

## Installation
1. Place the `swipe-antiafk` folder in your server's `[scripts]` directory.
2. Configure `config.lua` as needed.
3. Add `ensure swipe-antiafk` to your `server.cfg`.

## Discord Webhook
Set your Discord webhook URL in `server/main.lua` at the top of the file:
```lua
local webhookURL = "https://discord.com/api/webhooks/your_webhook_here"
```

## Debug Mode
To enable debug mode for testing, uncomment the debug lines in `config.lua`.

## Credits
- Script by Swipe

## License
This script is provided as-is. Use at your own risk.
