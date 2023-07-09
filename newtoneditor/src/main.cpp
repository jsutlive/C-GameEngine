#include <iostream>
#include "newton/engine.h"

int main()
{
	std::cout << "Hello World" << std::endl;

	newton::GetInfo();

	newton::Initialize();
	newton::Shutdown();
	return 0;
}