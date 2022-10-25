local manifest = dofile("_manifest.lua")
for _,filepath in ipairs(manifest) do
	include(filepath)
end
