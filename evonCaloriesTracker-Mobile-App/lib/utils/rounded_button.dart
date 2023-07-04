import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  // final VoidCallback apiFunction;
  final VoidCallback onPressed;
  final String buttonText;
  final Size? buttonSize;
  final MaterialStateProperty<Color>? foregroundColour;
  final MaterialStateProperty<Color>? backgroundColour;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.buttonSize,
    this.foregroundColour,
    this.backgroundColour,
  }) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.buttonText.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: widget.foregroundColour,
        backgroundColor: widget.backgroundColour,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(color: Colors.red),
          ),
        ),
        fixedSize: MaterialStateProperty.all(widget.buttonSize),
      ),
    );
  }
}
