import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/Add.dart';

/*
Input: “”, Output: 0
Input: “1”, Output: 1
Input: “1,5”, Output: 6
Input: "1\n2,3", Output: 6
*/

void main() {
  // Success case
  test('returns 0 for empty string', () {
    expect(add(''), equals(0));
  });

  // Success case
  test('returns number for single character', () {
    expect(add('1'), equals(1));
  });

  // Success case
  test('return 0 because its not number', () {
    expect(add('a'), equals(0));
  });

  // Success case
  test('returns sum of two numbers with comma separate', () {
    expect(add('9,4'), equals(13));
  });

  // Success case
  test('returns sum of two numbers with comma separate', () {
    expect(add('36,27'), equals(63));
  });

  // Success case
  test('handles newlines and commas as delimiters', () {
    expect(add('1\n2,3'), 6);
  });

  // Success case
  test('handles newlines and commas as with multiple number delimiters', () {
    expect(add('125,24,35\n16,'), 200);
  });

}
