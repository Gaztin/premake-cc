local p = premake
local m = p.extensions.cc

function m.compile(configuration)
	local project   = configuration.project
	local workspace = project.workspace
	print(workspace.name..":"..project.name)

	local toolname = configuration.toolset or "clang"
	local tool     = m.tools[toolname]
	verbosef(" Compiler: "..toolname)
	local output   = tool.compile(configuration)
	if output then
		return output
	end
end

function m.compileAndRun(configuration)
	local output = m.compile(configuration)
	if output then
		os.execute(output)
	end
end
