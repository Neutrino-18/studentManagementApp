// dropdown_but.dart
import "package:flutter/material.dart";

class DropDownMenu extends StatefulWidget {
  final List<String> items;
  final String hintText;

  const DropDownMenu(
      {super.key, required this.items, this.hintText = "Select an item"});

  @override
  State<DropDownMenu> createState() {
    return _DropDownMenuState();
  }
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownMenu<String>(
        initialSelection: selectedItem,
        onSelected: (String? value) {
          setState(() {
            selectedItem = value;
          });
        },
        dropdownMenuEntries: widget.items.map<DropdownMenuEntry<String>>(
          (String item) {
            return DropdownMenuEntry<String>(
              value: item,
              label: item,
              enabled: true,
            );
          },
        ).toList(),
        textStyle: const TextStyle(fontSize: 14),
        hintText: widget.hintText,
      ),
    );
  }
}
