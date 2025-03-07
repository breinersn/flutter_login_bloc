import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool fullWidth;
  final EdgeInsets padding;
  final Color backgroundColor, textColor;

  const MyBtn(
      {super.key,
      required this.fullWidth,
      required this.label,
      required this.onPressed,
      required this.backgroundColor,
      required this.padding,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 30,
      padding: EdgeInsets.zero,
      child: Container(
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, blurRadius: 10, offset: Offset(0, 5))
            ]),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor ?? Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
        ),
      ),
      onPressed: () {
        FocusScope.of(context).unfocus();
        onPressed();
      },
    );
  }
}
