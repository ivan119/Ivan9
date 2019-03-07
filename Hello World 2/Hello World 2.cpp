// ConsoleApplication2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
using namespace std;

int main()

{
	int godine = 27;

	cout << "Hello World!\n";
	cout << "Iliti Dobar dan!\n";
	cout << "Ime mi je Ivan\n";
	cout << "Imam " << godine << " godina" << endl;

	int broj1, broj2;

	cout << "Unesite prvi broj: ";
	cin >> broj1;

	cout << "Unesite drugi broj: ";
	cin >> broj2;

	cout << broj1 << " i " << broj2 << endl;

	cout << "Dobar dan.Vi mora da ste:\n";
	string ime, prezime,podatci;
	cin >> ime;
	cin >> prezime;


	cout <<"Vase ime je "<<ime<<" "<<prezime<<". Zadovoljstvo mi je biti vase racunalo!";

	cin.ignore();
	getline(cin, podatci);

	cout << "Vasim podatci su: " << podatci;endl



	cout << "x vrijednost           y vrijednost         izraz          rezultat" << endl;
	cout << "10                     5                    x = y + 3      x = 8" << endl;
	cout << "10                     5                    x = y - 3      x = 3" << endl;
	cout << "10                     5                    x = y * 3      x = 25" << endl;
	cout << "10                     5                    x = x / y      x = 2" << endl;
	cout << "10                     5                    x = x % y      x = 0" << endl;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
