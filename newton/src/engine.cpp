#include "engine.h"
#include <iostream>
#include "SDL2/SDL.h"

namespace newton
{
	//public:

	Engine& Engine::Instance()
	{
		if (!mInstance) {
			mInstance = new Engine();
		}
		return *mInstance;
	}

	void Engine::Run() {
		if (Initialize()) 
		{
			while (mIsRunning) 
			{
				mWindow.PumpEvents();
			}
		}
	}

	bool Engine::Initialize()
	{
		bool ret = false;
		if (SDL_Init(SDL_INIT_EVERYTHING) < 0) {
			std::cout << "Error initializing SDL2" << SDL_GetError() << std::endl;
		}
		else {
			SDL_version version;
			SDL_VERSION(&version);
			std::cout << "SDL " << (int32_t)version.major << "." << (int32_t)version.minor << "." << (int32_t)version.patch << std::endl;

			if (mWindow.Create()) {
				mIsRunning = true;
				ret = true;
			}
		}
		if (!ret)
		{
			std::cout << "Engine initialization failed, shutting down." << std::endl;
			Shutdown();
		}

		return ret;
	}

	void Engine::Shutdown() {
		mIsRunning = false;
		mWindow.Shutdown();
		SDL_Quit();
	}

	//private:
	void Engine::GetInfo() 
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

	Engine* Engine::mInstance = nullptr;
	Engine::Engine()
	{
		mIsRunning = false;
		GetInfo();
	}
}
