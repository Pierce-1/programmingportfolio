#include <iostream>
using namespace std;

int main() {
  int i, j, guess, anum = 0;
  srand((unsigned)time(NULL));
  cout << "Guess a number between 1 and 100" << endl;
  for (i = 0; i < 1; i++) {
    j = rand() % 100;
  //  cout << " Random Number : " << j << endl;
  }

  while (guess != j) {
    cin >> guess;
    anum = anum + 1;
    if (guess == j) {
      cout << "Your are correct" << endl;
    } else if (guess < j) {
      cout << "Try again, " << guess << " is too low" << endl;
    } else {
      cout << "Try again, " << guess << " is too high" << endl;
    }
  }
  if (anum == 1) {
    cout << "Great job, you guessed it on the 1st try" << endl;
  } else {
    cout << "You guessed the correct number in " << anum << " attempts" << endl;
  }
}