#include <iostream>
#include "newton/engine.h"

int main()
{
	std::cout << "Hello World" << std::endl;
	int a = newton::Add(10, 5);
	int b = newton::Sub(10, 5);

	std::cout << a << ", " << b << std::endl;

	newton::GetInfo();

	return 0;
}