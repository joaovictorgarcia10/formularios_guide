import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GTextfield extends StatelessWidget {
  final bool? obscureText;
  final String label;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String? text)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const GTextfield({
    Key? key,
    this.obscureText,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputFormatters ?? [],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          labelStyle: const TextStyle(),
        ),
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
      ),
    );
  }
}
