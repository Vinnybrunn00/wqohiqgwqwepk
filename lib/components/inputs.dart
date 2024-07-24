import 'package:flutter/material.dart';

class InputsComponents extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;
  final bool required;

  const InputsComponents({
    super.key,
    required this.label,
    required this.hintText,
    this.required = true,
    required this.controller,
    this.validator,
  });

  @override
  State<InputsComponents> createState() => _InputsComponentsState();
}

class _InputsComponentsState extends State<InputsComponents> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14,
          color: Colors.white.withOpacity(.6),
          fontWeight: FontWeight.bold,
        ),
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.red.shade400,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade400,
            ),
          ),
          label: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white.withOpacity(.8),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.cyan),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
