import 'package:flutter/material.dart';

class custom_app_bar extends StatelessWidget {
  const custom_app_bar({
    super.key,
    required this.title,
    required this.icon,
    this.onBtnClick,
  });
  final String title;
  final Icon icon;
  final void Function()? onBtnClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: onBtnClick,
            backgroundColor: Colors.black.withOpacity(.4),
            child: icon,
          )
        ],
      ),
    );
  }
}
