workspace "newton"
	startproject "newtoneditor"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release"
	}

tdir = "bin/%{cfg.buildcfg}/%{prj.name}"
odir = "bin-obj/%{cfg.buildcfg}/%{prj.name}"

project "newton"
	location "newton"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir(tdir)
	objdir(odir)

	files
	{
		"%{prj.name}/include/**.h",
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	sysincludedirs
	{
		"%{prj.name}/include/newton"

	}

	flags
	{
		"FatalWarnings"
	}

project "newtoneditor"
	location "newtoneditor"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"	
	staticruntime "on"
	links "newton"

	targetdir(tdir)
	objdir(odir)

	sysincludedirs
	{
		"newton/include"
	}

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	flags
	{
		"FatalWarnings"
	}