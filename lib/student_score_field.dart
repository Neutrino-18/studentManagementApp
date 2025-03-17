import 'package:app_crt/Common/Widgets/text_field.dart';
import 'package:flutter/material.dart';

class StudentScoreTestField extends StatelessWidget {
  const StudentScoreTestField(
      {super.key,
      required this.onPressed,
      this.controller1,
      this.controller2,
      this.controller3});

  final VoidCallback onPressed;
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final TextEditingController? controller3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 30,
            ),
            MyTextField(
              hintText: 'How much he/she scored?',
              labelText: 'Enter Score',
              keyboardType: TextInputType.number,
              textEditingController: controller1,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              textEditingController: controller2,
              hintText: 'How did he/she performed?',
              labelText: 'Enter Remarks',
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              textEditingController: controller3,
              autoFillHints: [1.toString(), 2.toString(), 3.toString()],
              keyboardType: TextInputType.number,
              hintText: '1, 2 or 3 ',
              labelText: 'Enter Round',
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onPressed,
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Post",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
