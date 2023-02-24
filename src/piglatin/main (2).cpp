#include <bits/stdc++.h>
#include <iostream>
using namespace std;
string word, firstLetter, lastPart;
int chars;

bool isVowel(char c) {
  return (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u');
}
int main() {
  cout << "Type a word to convert it to piglatin:" << endl;
  cin >> word;
  transform(word.begin(), word.end(), word.begin(), ::tolower);

  chars = word.length();
  firstLetter = word[0];
  for (int i = 1; i < chars; i++) {
    lastPart += word[i];
  }
  cout << " Characters: " + to_string(chars) << endl;
  cout << +" First Letter: " + firstLetter<< endl;
  cout<<" Rest of the word: " + lastPart<<endl;
  cout<<" Pig Latin word: " + lastPart + firstLetter + "ay ";
}