import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<String?> {
  MessageCubit() : super(null);

  calculate(String input, int Function(String) addFn) {
    try {
      final result = addFn(input);
      //print("Result : ${result}");
      emit("Result: $result");
    } on FormatException catch (e) {
      //print("Result : ${e}");
      emit(e.message); // ✅ emit the exception message to Snackbar
    } catch (e) {
      //print("Result : ${e}");
      emit("Unknown error: $e");
    }
  }

  clear() => emit(null);
}
