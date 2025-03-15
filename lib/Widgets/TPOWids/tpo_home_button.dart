import 'package:app_crt/Providers/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TPOHomeBut extends ConsumerWidget {
  const TPOHomeBut({super.key, required this.text, required this.onTap});

  final String text;
  final int onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      // onDoubleTap: () {
      //   ref.read(historyProvider.notifier).updateIndex(2);
      // },
      onTap: () async {
        ref.read(historyProvider.notifier).updateIndex(onTap);
      },
      child: Stack(
        children: [
          Container(
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
                    color: Theme.of(context).colorScheme.surface, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
