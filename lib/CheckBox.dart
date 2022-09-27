import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({required this.value, required this.onChanged, Key? key})
      : super(key: key);
  final bool value;
  final ValueChanged<bool?>? onChanged;
  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    Color getResolverColor(Set<MaterialState> materialStates) {
      final interactiveStates = {
        MaterialState.focused,
        MaterialState.hovered,
        MaterialState.pressed
      };
      if (materialStates.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.green;
    }

    return Checkbox(
      fillColor: MaterialStateProperty.resolveWith(getResolverColor),
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}

