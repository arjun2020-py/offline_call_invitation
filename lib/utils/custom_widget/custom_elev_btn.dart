import 'package:flutter/material.dart';

class CustomElvBtn extends StatelessWidget {
  const CustomElvBtn({super.key, required this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: onPressed,
        child: child);
  }
}
