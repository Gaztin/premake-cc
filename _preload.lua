local p = premake
p.extensions.cc = p.extensions.cc or {
	__cache__ = {},
	_HOST     = os.host(),
	_VERSION  = p._VERSION,
}
local m     = p.extensions.cc
local cache = m.__cache__

newaction {
	trigger = "compile",
	description = "Compiles your project.",

	onProject = function(prj)
		cache.targetConfig = p.project.getfirstconfig(prj)
	end,

	execute = function()
		m.compile(cache.targetConfig)
	end,
}

newaction {
	trigger = "run",
	description = "Compiles and runs your project.",

	onProject = function(prj)
		cache.targetConfig = p.project.getfirstconfig(prj)
	end,

	execute = function()
		m.compileAndRun(cache.targetConfig)
	end,
}
