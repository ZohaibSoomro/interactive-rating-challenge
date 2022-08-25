import 'package:flutter/material.dart';
import 'package:interactive_rating_challenge/constants.dart';

class RoundedCenteredCard extends StatelessWidget {
  const RoundedCenteredCard(
      {Key? key, required this.child, this.marginVertical = 100})
      : super(key: key);
  final Widget child;
  final double marginVertical;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: kCardBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: marginVertical),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: child,
        ),
      ),
    );
  }
}
