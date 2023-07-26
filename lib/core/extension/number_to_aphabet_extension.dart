const _alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

extension NumberToAlphabet on int {
  String toAlphabet() {
    int number = this;
    String result = '';

    while (number > 0) {
      int index = (number - 1) % 26;
      result = _alphabet[index] + result;
      number = ((number - 1) ~/ 26).toInt();
    }

    return result;
  }
}
