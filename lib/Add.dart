bool isDigit(String char) {
  return RegExp(r'\d').hasMatch(char);
}

int add(String input) {
  int sum = 0;
  String buffer = '';
  List<int> negatives = [];
  bool isNegative = false;

  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    bool end = i == input.length - 1;

    if (char == '-') {
      if (buffer.isNotEmpty) {
        int num = int.parse(buffer);
        if (isNegative) {
          negatives.add(-num);
        } else {
          sum += num;
        }
        buffer = '';
      }
      isNegative = true; // set for next number
    } else if (isDigit(char)) {
      buffer += char;
    } else {
      if (buffer.isNotEmpty) {
        int num = int.parse(buffer);
        if (isNegative) {
          negatives.add(-num);
        } else {
          sum += num;
        }
        buffer = '';
        isNegative = false;
      }
    }

    // Handle last character flush
    if (end && buffer.isNotEmpty) {
      int num = int.parse(buffer);
      if (isNegative) {
        negatives.add(-num);
      } else {
        sum += num;
      }
    }
  }
  if (negatives.isNotEmpty) {
    throw FormatException('negative numbers not allowed ${negatives.join(',')}');
  }
  return sum;
}