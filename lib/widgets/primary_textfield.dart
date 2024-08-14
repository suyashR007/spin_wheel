import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final bool? readOnly;
  final TextInputType? keyboard;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? insideHintText;
  final String? Function(String?)? validator;
  final int? maxlines;
  final List<TextInputFormatter>? inputFormatters;
  const PrimaryTextField({
    required this.hintText,
    required this.controller,
    required this.onChanged,
    this.validator,
    this.keyboard,
    this.insideHintText,
    this.readOnly,
    this.maxlines,
    this.inputFormatters,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: maxlines,
          controller: controller,
          keyboardType: keyboard,
          readOnly: (readOnly != null) ? readOnly! : false,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
              helperText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // focusColor: kGradientOrangeStart,
              hintText: insideHintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black))),
        ),
      ],
    );
  }
}
