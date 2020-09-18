CCVar@ cvar_Lazy;
CCVar@ cvar_Enabled;
CCVar@ cvar_LoadTime;
void PluginInit()
{
	g_Module.ScriptInfo.SetAuthor( "Lt." );
	g_Module.ScriptInfo.SetContactInfo( "https://steamcommunity.com/id/ibmlt/" );
	@cvar_Lazy = CCVar("lazy_cfg", "server_lazy", "Set cfg name", ConCommandFlag::AdminOnly);
	@cvar_Enabled = CCVar("lazy_enabled", 1, "Enable or disable this addon", ConCommandFlag::AdminOnly);
	@cvar_LoadTime = CCVar("lazy_time", 0.25, "Enable or disable this addon", ConCommandFlag::AdminOnly);
	MapStart();
}
void MapStart()
{
	if(cvar_Enabled.GetInt() == 0) return;
	if(cvar_LoadTime.GetFloat() <= 0.001)
	{
		LoadLazyConfig();
		return;
	}

	g_Scheduler.SetTimeout("LoadLazyConfig", cvar_LoadTime.GetFloat());
}
void LoadLazyConfig()
{
	string cfgname = cvar_Lazy.GetString();
	cfgname.Trim();
	if(cfgname.IsEmpty()) return;
	if(!cfgname.ToLowercase().EndsWith(".cfg")) cfgname += ".cfg";
	g_EngineFuncs.ServerCommand("exec " + cfgname + "\r\n");
	g_EngineFuncs.ServerPrint("\r\nLazy Config File " + cfgname + " is loaded\r\n");
}