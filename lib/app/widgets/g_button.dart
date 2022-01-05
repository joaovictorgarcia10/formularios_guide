import 'package:flutter/material.dart';

class GButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onTap;

  const GButton({
    Key? key,
    required this.text,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: const Icon(Icons.save_outlined),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
      ),
    );
  }
}
