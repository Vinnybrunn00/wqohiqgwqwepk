import 'package:flutter/material.dart';

class DropDownEvent extends StatefulWidget {
  final String value;
  final List<String> dropList;
  final void Function(String?)? onChanged;

  const DropDownEvent({
    super.key,
    required this.value,
    required this.dropList,
    this.onChanged,
  });

  @override
  State<DropDownEvent> createState() => _DropDownEventState();
}

class _DropDownEventState extends State<DropDownEvent> {
  String valor = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: TextStyle(
        color: Colors.white.withOpacity(0.8),
      ),
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.only(
        top: 2,
        bottom: 2,
        left: 5,
        right: 5,
      ),
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.white.withOpacity(0.5),
      ),
      value: widget.value,
      onChanged: widget.onChanged,
      items: widget.dropList.map(
        (String element) {
          return DropdownMenuItem(
            value: element,
            child: Text(
              element,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
