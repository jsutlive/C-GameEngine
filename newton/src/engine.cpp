#include "engine.h"
#include <iostream>

namespace newton
{
	int Add(int a, int b) 
	{
		return a + b;
	}

	void GetInfo() 
	{
#ifdef NEWTON_CONFIG_DEBUG
		std::cout << "Configuration: Debug" << std::endl;
#endif
#ifdef NEWTON_CONFIG_RELEASE
		std::cout << "Configuration: Release" << std::endl;
#endif
#ifdef NEWTON_PLATFORM_WINDOWS
		std::cout << "Platform: Windows" << std::endl;
#endif
#ifdef NEWTON_PLATFORM_MAC
		std::cout << "Platform: Mac OSX" << std::endl;
#endif
#ifdef NEWTON_PLATFORM_LINUX
		std::cout << "Platform: Linux" << std::endl;
#endif

	}
}
