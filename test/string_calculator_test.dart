import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/Add.dart';

/*
Input: “”, Output: 0
* */

void main() {
  // Success case
  test('returns 0 for empty string', () {
    expect(add(''), equals(0));
  });
}
