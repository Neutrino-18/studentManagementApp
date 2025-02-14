import 'package:flutter/material.dart';

class TPOHomeBut extends StatelessWidget {
  const TPOHomeBut({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 270,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.background, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
// ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 backgroundColor: Colors.purple,
//                 elevation: 8,
//                 shadowColor: Colors.purple.withOpacity(0.5),
//               ),
//               child: const Text(
//                 'Explore',
//                 style: TextStyle(fontSize: 20, letterSpacing: 1.2),
//               ),
//             ),