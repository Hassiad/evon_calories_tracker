import 'package:flutter/material.dart';

class RoundedTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? hint;
  final String? labelText;
  final String? initialValue;
  final bool obscureText;
  final Widget? suffixIcon;

  const RoundedTextFormField({
    Key? key,
    this.controller,
    this.icon,
    this.textInputType,
    this.hintText,
    this.labelText,
    this.textInputAction,
    this.validator,
    this.initialValue,
    required this.obscureText,
    this.suffixIcon,
    this.hint,
  }) : super(key: key);

  @override
  State<RoundedTextFormField> createState() => _RoundedTextFormFieldState();
}

class _RoundedTextFormFieldState extends State<RoundedTextFormField> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        initialValue: widget.initialValue,
        obscureText: widget.obscureText as bool,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          filled: true,
          fillColor: const Color(0xffffffff),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(width: 1, color: Colors.orange),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          hintText: widget.hintText,
          // hintText: 'Email or Phone number',
          // helperText: 'Please enter it correctly.',
          labelText: widget.labelText,
          // hint
          prefixIcon: Icon(
            widget.icon,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
