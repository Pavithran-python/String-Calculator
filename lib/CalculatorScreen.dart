import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Add.dart';
import 'MessageCubit.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageCubit, String?>(
      listener: (context, state) {
        if (state != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              duration: Duration(seconds: 3),
            ),
          );
          context.read<MessageCubit>().clear(); // clear after showing
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('String Calculator',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Number', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  SizedBox()
                ],
              ),
              SizedBox(height: 8),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter number string',
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(175,40)),
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () {
                  //print("Input : ${_controller.text}");
                  FocusScope.of(context).unfocus();
                  context.read<MessageCubit>().calculate(_controller.text,add);
                },
                child: const Text('Submit',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
