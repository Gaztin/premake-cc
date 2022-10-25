local p       = premake
local m       = p.extensions.cc
m.tools       = m.tools or {}
m.tools.clang = {}
local clang   = m.tools.clang

function clang.compile(configuration)
	local targetInfo = p.config.gettargetinfo(configuration)
	local outputPath = targetInfo.name
	verbosef(" Target: %s", outputPath)
	
	for _,file in ipairs(configuration.files) do
		local result = clang.compileFile(configuration, file, outputPath)
		if result then
			return result
		end
	end
end

function clang.compileFile(configuration, inputPath, outputPath)
	local project = configuration.project
	local relativePath = p.project.getrelative(project, inputPath)
	print(" > "..relativePath)

	local cliCommand = clang.getCLICommand(inputPath, outputPath)
	verbosef("%s", cliCommand)
	local _,_,exit_code = os.execute(cliCommand)
	if exit_code == 0 then
		return outputPath
	end
end

function clang.getCLIPath()
	if m._HOST == "windows" then
		local programFiles = os.getenv("ProgramW6432")
		local llvmPath     = path.join(programFiles, "LLVM")
		local clangPath    = path.join(llvmPath, "bin", "clang++.exe")
		return path.normalize(clangPath)
	end
end

function clang.getCLICommand(inputPath, outputPath)
	local cliPath = clang.getCLIPath()

	if m._HOST == "windows" then
		-- TODO: What if path contains spaces?
		return "\""..cliPath.."\" "..inputPath.." -o "..outputPath
	end
end
