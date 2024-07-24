import 'package:flutter/material.dart';

class EventButton extends StatefulWidget {
  final void Function()? onTap;
  final String text;
  final bool isLoading;

  const EventButton({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  @override
  State<EventButton> createState() => _EventButtonState();
}

class _EventButtonState extends State<EventButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 53,
      width: 200,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: !widget.isLoading ? widget.onTap : null,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: !widget.isLoading
                  ? Text(
                      widget.text,
                      style: const TextStyle(
                        color: Color(0xff303642),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : const CircularProgressIndicator(color: Colors.orange),
            ),
          ),
        ),
      ),
    );
  }
}
