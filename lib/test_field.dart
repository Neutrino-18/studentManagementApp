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
            labelText: 'Enter Score',
          ),
          SizedBox(
            height: 10,
          ),
          MyTextField(
            labelText: 'Enter Remarks',
          ),
        ],
      ),
    );
  }
}
