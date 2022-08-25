import 'package:flutter/material.dart';
import 'package:interactive_rating_challenge/constants.dart';
import 'package:interactive_rating_challenge/widgets/rounded_centered_card.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key, required this.rating}) : super(key: key);
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBgColor,
      body: RoundedCenteredCard(
        marginVertical: 130,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Hero(
                tag: 'animate',
                child: FlutterLogo(
                  size: 150,
                  duration: Duration(milliseconds: 500),
                ),
              ),
              buildRatingSelectionTile(rating),
              const Text(
                'Thank You!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'We appreciate you taking the time to give a rating. If your ever need more support, don\'t hesitate to get in touch!',
                style: TextStyle(
                  color: kRatingBtnTextColor,
                  fontSize: 17,
                  letterSpacing: 0.1,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRatingSelectionTile(int rating) {
    return Card(
      color: kRatingBtnBgColor,
      elevation: 3.0,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'You selected $rating out of 5',
          style: const TextStyle(
            color: kSubmitBtnBgColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
