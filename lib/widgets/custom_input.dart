import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSave,
    this.onChange,
  });

  final String hint;
  final int maxLines;
  final void Function(String?)? onSave;
  final void Function(String)? onChange;
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      onSaved: widget.onSave,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is Required';
        } else {
          return null;
        }
      },
      maxLines: widget.maxLines,
      initialValue: widget.hint,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black38, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffFFCB7A), width: 1),
        ),
      ),
    );
  }
}
