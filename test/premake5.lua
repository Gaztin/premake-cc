require "../init"

workspace "MyWorkspace"
	configurations {"Debug", "Release"}

project "MyApp"
	kind "ConsoleApp"
	files {"main.cpp"}
