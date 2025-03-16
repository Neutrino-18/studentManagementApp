import 'package:app_crt/Common/Widgets/text_field.dart';
import 'package:flutter/material.dart';

class TestField extends StatelessWidget {
  const TestField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(
            hintText: 'How much he/she scored?',
            labelText: 'Enter Score',
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: 'How did he/she performed?',
            labelText: 'Enter Remarks',
          ),
          SizedBox(
            height: 10,
          ),
          MyTextField(
            keyboardType: TextInputType.number,
            hintText: '1, 2 or 3 ',
            labelText: 'Enter Round',
          )
        ],
      ),
    );
  }
}
