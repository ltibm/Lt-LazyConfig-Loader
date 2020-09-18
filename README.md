## Installation
1. Download  **lt_lazyconfig.as** and copy to **scripts/plugins** folder.
2. Download **server_lazy.cfg** or create **server_lazy.cfg** on svencoop folder.
3. Open your **default_plugins.txt** in **svencoop** folder
  and put in;
```
"plugin"
{
    "name" "Lt - Lazy Config Loader"
    "script" "lt_lazyconfig"
    "concommandns" "lt"
}
```
3. Send command **as_reloadplugins** to server or restart server.

## Commands
- usage **as_command lt.lazy_enabled 1**
- **lt.lazy_enabled**: 0 or 1, Enable or Disable current plugin (default 1).
- **lt.lazy_cfg**: Set lazy cfg filename (default server_lazy.cfg)
- **lt.lazy_time** Set lazy config file load time after MapActivate triggered(default 0.25);


This is very simple angelscript plugin.