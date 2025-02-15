import "package:flutter/material.dart";

class BoxProp extends StatelessWidget {
  const BoxProp(
      {super.key,
      required this.headingText,
      required this.contentText,
      this.onPressed});

  final String headingText;
  final String contentText;
  final void Function()? onPressed;

  @override
  Widget build(context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(headingText,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondary,
              padding: const EdgeInsets.all(10),
              child: Text(
                contentText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onBackground),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
