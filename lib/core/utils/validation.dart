bool isValidInput(String input, bool Function(String) isValidChar) {
  for (var rune in input.runes) {
    var character = String.fromCharCode(rune);
    if (!isValidChar(character)) {
      return false;
    }
  }
  return true;
}

bool isValidQrCode(String input) {
  var units = List<int>.from(input.codeUnits)..sort();
  for (var unit in units) {
    if (!(unit == 45 ||
        unit == 32 ||
        (unit >= 47 && unit <= 57) ||
        (unit >= 65 && unit <= 90) ||
        (unit >= 97 && unit <= 122))) {
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
