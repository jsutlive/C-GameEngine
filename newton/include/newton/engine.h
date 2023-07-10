#pragma once
#include "core/window.h"

namespace newton
{
	class Engine 
	{
	public:
		static Engine& Instance();
		~Engine() {}

		
		void Run();
		inline void Quit(){	mIsRunning = false;}

	private:
		void GetInfo();
		[[nodiscard]] bool Initialize();		// no discard tag throws warning if return variable not captured
		void Shutdown();

		core::Window mWindow;
		bool mIsRunning;

		//Singleton - use private constructor
		Engine();
		static Engine* mInstance;
	};

}