import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/Add.dart';

/*
Input: “”, Output: 0
Input: “1”, Output: 1
* */

void main() {
  // Success case
  test('returns 0 for empty string', () {
    expect(add(''), equals(0));
  });

  // Success case
  test('returns number for single character', () {
    expect(add('1'), equals(1));
  });

  // Failure case
  test('throws exception because string has not a number', () {
    expect(() => add('a'), throwsFormatException);
  });

}
