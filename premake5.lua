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

-- External Dependencies
externals = {}
externals["SDL2"] = "external/SDL2"

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
		"%{prj.name}/include/newton",
		"%{externals.SDL2}/include/"

	}

	flags
	{
		"FatalWarnings"
	}

	filter{"system:windows", "configurations:*"}
		systermversion = "latest"

		defines
		{
			"NEWTON_PLATFORM_WINDOWS"
		}

	filter{"system:linux", "configurations:*"}
		systermversion = "latest"

		defines
		{
			"NEWTON_PLATFORM_LINUX"
		}

	filter{"system:macosx", "configurations:*"}
		systermversion = "latest"

		xcodebuildsettings
		{
			["MACOSX_DEPLOYMENT_TARGET"] = "10.15",
			["UseModernBuildSystem"] = "NO"
		}

		defines
		{
			"NEWTON_PLATFORM_MAC"
		}

	filter "configurations:Debug"
		defines
		{
			"NEWTON_CONFIG_DEBUG"
		}
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines
		{
			"NEWTON_CONFIG_RELEASE"
		}
		runtime "Release"
		symbols "off"
		optimize "on"

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

	filter{"system:windows", "configurations:*"}
		systermversion = "latest"

		defines
		{
			"NEWTON_PLATFORM_WINDOWS"
		}

		libdirs
		{
			"%{externals.SDL2}/lib"
		}

		links
		{
			"SDL2"
		}

	filter{"system:linux", "configurations:*"}
		systermversion = "latest"

		defines
		{
			"NEWTON_PLATFORM_LINUX"
		}

	filter{"system:macosx", "configurations:*"}
		systermversion = "latest"

		xcodebuildsettings
		{
			["MACOSX_DEPLOYMENT_TARGET"] = "10.15",
			["UseModernBuildSystem"] = "NO"
		}

		defines
		{
			"NEWTON_PLATFORM_MAC"
		}

	filter "configurations:Debug"
		defines
		{
			"NEWTON_CONFIG_DEBUG"
		}
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines
		{
			"NEWTON_CONFIG_RELEASE"
		}
		runtime "Release"
		symbols "off"
		optimize "on"