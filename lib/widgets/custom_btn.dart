import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.onTap, required this.isLoading,
  });
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          backgroundColor: const Color(0xffFFCB7A),
          fixedSize: Size(MediaQuery.of(context).size.width, 40)),
      child: isLoading ? const CircularProgressIndicator(color: Colors.black,) : const Text(
        'Add',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
