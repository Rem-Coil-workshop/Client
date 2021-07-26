bool isValidInput(String input, bool Function(String) isValidChar) {
  if (input.isEmpty) return false;

  for (var rune in input.runes) {
    var character = String.fromCharCode(rune);
    if (!isValidChar(character)) {
      return false;
    }
  }
  return true;
}

bool isAll(String character) => true;

bool isWord(String character) =>
    !isDigit(character) && !isSpecSymbol(character);

bool isDigit(String character) =>
    "0".compareTo(character) <= 0 && "9".compareTo(character) >= 0;

bool isSpecSymbol(String character) =>
    character == '?' ||
    character == '!' ||
    character == '/' ||
    character == '.' ||
    character == '-' ||
    character == '_' ||
    character == '+' ||
    character == '=' ||
    character == ',';
