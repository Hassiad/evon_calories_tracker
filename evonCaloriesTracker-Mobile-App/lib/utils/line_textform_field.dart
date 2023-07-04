import 'package:flutter/material.dart';

class LineTextFormField extends StatefulWidget {
  final dynamic controller;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final double? sizedBoxWidth;
  final double? sizedBoxHeight;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final bool obscureText;
  final Widget? suffixIcon;

  const LineTextFormField({
    Key? key,
    this.controller,
    this.icon,
    this.sizedBoxWidth,
    this.textInputType,
    this.hintText,
    this.labelText,
    this.textInputAction,
    this.validator,
    this.initialValue,
    required this.obscureText,
    this.suffixIcon,
    this.sizedBoxHeight,
  }) : super(key: key);

  @override
  State<LineTextFormField> createState() => _LineTextFormFieldState();
}

class _LineTextFormFieldState extends State<LineTextFormField> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.sizedBoxWidth,
      height: widget.sizedBoxHeight,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        initialValue: widget.initialValue,
        obscureText: widget.obscureText,
        // minLines: 1,
        // maxLines: 5,
        // style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          filled: true,
          fillColor: const Color(0xffffffff),
          // focusedBorder: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(1.0)),
          //   borderSide: BorderSide(width: 1, color: Colors.red),
          // ),
          // disabledBorder: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(1.0)),
          //   borderSide: BorderSide(width: 1, color: Colors.orange),
          // ),
          // enabledBorder: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(1.0)),
          //   borderSide: BorderSide(width: 1, color: Colors.red),
          // ),
          // border: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(1.0)),
          //   borderSide: BorderSide(
          //     width: 1,
          //   ),
          // ),
          // errorBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(1.0)),
          //     borderSide: BorderSide(width: 1, color: Colors.red)),
          // focusedErrorBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(1.0)),
          //     borderSide: BorderSide(width: 1, color: Colors.red)),
          hintText: widget.hintText,
          // hintText: 'Email or Phone number',
          // helperText: 'Please enter it correctly.',
          labelText: widget.labelText,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
