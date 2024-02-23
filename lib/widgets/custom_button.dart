import 'package:flutter/material.dart';
import 'package:twitch_clone/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap,this.textStyle = const TextStyle()});

  final String text;
  final VoidCallback onTap;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(double.infinity, 40)),
      child: Text(text),
      
      
    );
  }
}
