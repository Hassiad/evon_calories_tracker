import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final String buttonText;

  const ButtonText(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.buttonText})
      : super(key: key);

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: const TextStyle(color: Colors.black, fontSize: 17.0),
        ),
        TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.buttonText.toUpperCase(),
          ),
        )
      ],
    );
  }
}
