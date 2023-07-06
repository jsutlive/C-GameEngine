workspace "newton"
	startproject "newtoneditor"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release"
	}

project "newtoneditor"
	location "newtoneditor"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	flags
	{
		"FatalWarnings"
	}