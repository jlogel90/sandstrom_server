# Insurgency: Sandstorm Dedidacted Server Config Files

See NWI Official Documentation [Server Admin Guide](https://support.newworldinteractive.com/support/solutions/articles/47001115510-server-admin-guide) for reference

## Location of configuration files

By default (if you don't specify a **force_install_dir** option with SteamCMD) configuration files are saved here:

- **For Linux**: {SteamInstallationFolder}/steamapps/common/sandstorm_server/Insurgency/Saved/Config/LinuxServer
- **For Windows**: {SteamInstallationFolder}\steamapps\common\sandstorm_server\Insurgency\Saved\Config\WindowsServer

## List of configuration files

Insurgency: Sandstorm Dedidacted Server Config Files consists into several files

- **Admins.txt**: contains admin list of the server
    > Pseudos must be converted into Steam ID (aka steamID64) using [STEAMID I/O](https://steamid.io/)
- **Game.ini (and for some old configuration Engine.ini)**: contains parameters for server it self and game modes
- **MapCycle.txt**: contains list of maps used for map cycling and voting