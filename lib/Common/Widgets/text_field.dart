import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      this.textEditingController,
      this.validator,
      this.labelText,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.onFieldSubmitted});

  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme.onSurface;
    final borderRadius = BorderRadius.circular(20);
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: myColor),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        focusColor: myColor,
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.bodyLarge!.copyWith(color: myColor),
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: myColor.withOpacity(0.8)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: myColor.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: myColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 199, 104, 104)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 199, 104, 104)),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      this.textEditingController,
      this.validator,
      this.labelText,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.onSubmitted,
      this.onTap});

  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme.onSurface;
    final borderRadius = BorderRadius.circular(10);
    return TextField(
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: myColor),
      onTap: onTap,
      onSubmitted: onSubmitted,
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        focusColor: myColor,
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.bodyLarge!.copyWith(color: myColor),
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: myColor.withOpacity(0.8)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: myColor.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: myColor.withOpacity(0.5)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 199, 104, 104)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 199, 104, 104)),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
