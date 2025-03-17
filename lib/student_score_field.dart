import 'package:app_crt/Common/Widgets/text_field.dart';
import 'package:flutter/material.dart';

class StudentScoreTestField extends StatelessWidget {
  const StudentScoreTestField({super.key});

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
            const MyTextField(
              hintText: 'How much he/she scored?',
              labelText: 'Enter Score',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            const MyTextField(
              hintText: 'How did he/she performed?',
              labelText: 'Enter Remarks',
            ),
            const SizedBox(
              height: 10,
            ),
            const MyTextField(
              keyboardType: TextInputType.number,
              hintText: '1, 2 or 3 ',
              labelText: 'Enter Round',
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
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
