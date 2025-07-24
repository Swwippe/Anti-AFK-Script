--   ______  ________ __    __       ______   ______  __    __  ______  ______  ______  
--  /      \|        \  \  /  \     /      \ /      \|  \  |  \/      \|      \/      \ 
-- |  ▓▓▓▓▓▓\ ▓▓▓▓▓▓▓▓ ▓▓ /  ▓▓    |  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓\ | ▓▓  ▓▓▓▓▓▓\\▓▓▓▓▓▓  ▓▓▓▓▓▓\
-- | ▓▓__| ▓▓ ▓▓__   | ▓▓/  ▓▓     | ▓▓   \▓▓ ▓▓  | ▓▓ ▓▓▓\| ▓▓ ▓▓_  \▓▓ | ▓▓ | ▓▓ __\▓▓
-- | ▓▓    ▓▓ ▓▓  \  | ▓▓  ▓▓      | ▓▓     | ▓▓  | ▓▓ ▓▓▓▓\ ▓▓ ▓▓ \     | ▓▓ | ▓▓|    \
-- | ▓▓▓▓▓▓▓▓ ▓▓▓▓▓  | ▓▓▓▓▓\      | ▓▓   __| ▓▓  | ▓▓ ▓▓\▓▓ ▓▓ ▓▓▓▓     | ▓▓ | ▓▓ \▓▓▓▓
-- | ▓▓  | ▓▓ ▓▓     | ▓▓ \▓▓\     | ▓▓__/  \ ▓▓__/ ▓▓ ▓▓ \▓▓▓▓ ▓▓      _| ▓▓_| ▓▓__| ▓▓
-- | ▓▓  | ▓▓ ▓▓     | ▓▓  \▓▓\     \▓▓    ▓▓\▓▓    ▓▓ ▓▓  \▓▓▓ ▓▓     |   ▓▓ \\▓▓    ▓▓
--  \▓▓   \▓▓\▓▓      \▓▓   \▓▓      \▓▓▓▓▓▓  \▓▓▓▓▓▓ \▓▓   \▓▓\▓▓      \▓▓▓▓▓▓ \▓▓▓▓▓▓  

Config = {}

-- Max idle time in **minutes**
Config.MaxAFKMinutes = 40 -- 40 minutes

-- Warn player before kick (true/false)
Config.WarnBeforeKick = true

-- Time before actual kick after warning (in seconds)
-- This is the duration the player has to respond after being warned
Config.WarningDuration = 1800 -- 30 minutes


--  _______  ________ _______  __    __  ______       ________ ________  ______  ________ ______ __    __  ______  
-- |       \|        \       \|  \  |  \/      \     |        \        \/      \|        \      \  \  |  \/      \ 
-- | ▓▓▓▓▓▓▓\ ▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓\ ▓▓  | ▓▓  ▓▓▓▓▓▓\     \▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓\\▓▓▓▓▓▓▓▓\▓▓▓▓▓▓ ▓▓\ | ▓▓  ▓▓▓▓▓▓\
-- | ▓▓  | ▓▓ ▓▓__   | ▓▓__/ ▓▓ ▓▓  | ▓▓ ▓▓ __\▓▓       | ▓▓  | ▓▓__   | ▓▓___\▓▓  | ▓▓    | ▓▓ | ▓▓▓\| ▓▓ ▓▓ __\▓▓
-- | ▓▓  | ▓▓ ▓▓  \  | ▓▓    ▓▓ ▓▓  | ▓▓ ▓▓|    \       | ▓▓  | ▓▓  \   \▓▓    \   | ▓▓    | ▓▓ | ▓▓▓▓\ ▓▓ ▓▓|    \
-- | ▓▓  | ▓▓ ▓▓▓▓▓  | ▓▓▓▓▓▓▓\ ▓▓  | ▓▓ ▓▓ \▓▓▓▓       | ▓▓  | ▓▓▓▓▓   _\▓▓▓▓▓▓\  | ▓▓    | ▓▓ | ▓▓\▓▓ ▓▓ ▓▓ \▓▓▓▓
-- | ▓▓__/ ▓▓ ▓▓_____| ▓▓__/ ▓▓ ▓▓__/ ▓▓ ▓▓__| ▓▓       | ▓▓  | ▓▓_____|  \__| ▓▓  | ▓▓   _| ▓▓_| ▓▓ \▓▓▓▓ ▓▓__| ▓▓
-- | ▓▓    ▓▓ ▓▓     \ ▓▓    ▓▓\▓▓    ▓▓\▓▓    ▓▓       | ▓▓  | ▓▓     \\▓▓    ▓▓  | ▓▓  |   ▓▓ \ ▓▓  \▓▓▓\▓▓    ▓▓
--  \▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓▓\▓▓▓▓▓▓▓  \▓▓▓▓▓▓  \▓▓▓▓▓▓         \▓▓   \▓▓▓▓▓▓▓▓ \▓▓▓▓▓▓    \▓▓   \▓▓▓▓▓▓\▓▓   \▓▓ \▓▓▓▓▓▓ 

-- Enable debug logging and disable actual kicks
-- Uncomment the following lines (16-21) to enable debug mode (Just remove the "--" at the beginning of each line defined below)

-- Config.Debug = true
-- if Config.Debug then
--     print('AntiAFK Debug Mode: Enabled')
--     Config.MaxAFKMinutes = 1 -- Set a longer time for testing
--     Config.WarnBeforeKick = true -- Enable warning for testing
-- end