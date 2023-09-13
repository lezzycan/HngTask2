import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.hintText,
      this.maxLines,
      this.enabled,
      required this.labelText,
      required this.controller});
  final String? hintText;
  final int? maxLines;
  final bool? enabled;
  final String? labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        //filled: true,
        //  fillColor: Colors.grey,
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Colors.grey)),
        //  OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(width: 1.0, color: Colors.grey),
        // ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Colors.grey)),
      ),
      enabled: enabled,
    );
  }
}
