import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/Add.dart';

/*
Input: “”, Output: 0
Input: “1”, Output: 1
Input: “1,5”, Output: 6
Input: "1\n2,3", Output: 6
Input: "//;\n1;2 , Output: 3
*/

void main() {
  group('String Calculator TDD Tests', () {
    // ✅ Success Cases

    test('returns 0 for empty input', () {
      expect(add(''), equals(0));
    });

    test('returns correct result for single number', () {
      expect(add('1'), equals(1));
    });

    test('ignores non-numeric single character and returns 0', () {
      expect(add('a'), equals(0));
    });

    test('returns sum for two comma-separated numbers', () {
      expect(add('9,4'), equals(13));
    });

    test('returns sum for two comma-separated numbers', () {
      expect(add('36,27'), equals(63));
    });

    test('handles newline and comma mixed delimiters', () {
      expect(add('1\n2,3'), equals(6));
    });

    test('handles newline and comma mixed delimiters', () {
      expect(add('125,24,35\n16,'), equals(200));
    });

    test('supports custom delimiter //;\\n syntax', () {
      expect(add('//;\n1;2'), equals(3));
    });

    test('returns 0 when no numbers present in custom delimiter case', () {
      expect(add('//;\nl,;'), equals(0));
    });

    test('extracts and sums numbers from input strings', () {
      expect(add('abc5,xyz6'), equals(11));
    });

    // ❌ Failure Cases

    test('throws error for single negative number', () {
      expect(() => add('1,-2'), throwsA(isA<FormatException>().having((e) => e.message, 'message', 'negative numbers not allowed -2')));
    });

    test('throws error for multiple negative numbers', () {
      expect(() => add('-1,-cghv-3,5 jhjh hbj '), throwsA(isA<FormatException>().having((e) => e.message, 'message', 'negative numbers not allowed -1,-3')));
    });

    test('throws error for double minus as one negative number', () {
      expect(() => add('--3'), throwsA(isA<FormatException>().having((e) => e.message, 'message', 'negative numbers not allowed -3',)));
    });
  });

}