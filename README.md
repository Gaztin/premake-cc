# premake-cc
This extension adds support for command-line compilation directly through Premake.

# Usage
Example project:
```lua
require "path/to/premake-cc"

workspace "MyWorkspace"
	configurations {"Debug", "Release"}

project "MyApp"
	kind "WindowedApp"
	files {"src/main.cpp"}
```
Command-line:
```
foo@bar:~$ premake5 compile
MyWorkspace:MyApp
 > main.cpp
```
