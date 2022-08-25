import 'package:flutter/material.dart';
import 'package:interactive_rating_challenge/constants.dart';

class CircularWidget extends StatelessWidget {
  const CircularWidget(
      {Key? key, required this.child, this.onPressed, this.isPressed = false})
      : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final bool isPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shape: const CircleBorder(),
      color: isPressed ? kSubmitBtnBgColor : kRatingBtnBgColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(25.0),
        onTap: onPressed,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 25,
          child: child,
        ),
      ),
    );
  }
}
