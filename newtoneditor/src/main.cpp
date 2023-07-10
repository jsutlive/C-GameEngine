#include <iostream>
#include "newton/engine.h"

int main()
{
	newton::Engine& engine = newton::Engine::Instance();
	engine.Run();
	std::cin.ignore();
	return 0;
}