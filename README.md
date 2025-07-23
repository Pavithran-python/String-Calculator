# 🧮 String Calculator – TDD Kata

This project is a Flutter-based implementation of the classic **String Calculator Kata** using **Test-Driven Development (TDD)** and **Bloc** state management.

---

## 🔧 Features Implemented

- ✅ Returns 0 for empty input
- ✅ Returns a single number as integer
- ✅ Handles comma `,` and newline `\n` delimiters
- ✅ Supports custom delimiters (e.g., `//;\n1;2`)
- ✅ Accepts unlimited numbers
- ✅ Throws `FormatException` for negative numbers
- ✅ Lists all negative numbers in the error message
- ✅ Ignores non-numeric characters
- ✅ Bloc + Snackbar to show result or error

---

## 🚀 How to Run

```bash
git clone https://github.com/Pavithran-python/String-Calculator.git
cd String-Calculator
flutter pub get
flutter run or flutter test --reporter expanded
