import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String label;
  final Function() onButtonTap;

  const MenuButton({super.key, required this.label, required this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onButtonTap();
      },
      child: Text(label),
    );
  }
}
