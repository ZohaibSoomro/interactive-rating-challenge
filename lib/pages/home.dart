import 'package:flutter/material.dart';
import 'package:interactive_rating_challenge/constants.dart';
import 'package:interactive_rating_challenge/pages/thankyou.dart';
import 'package:interactive_rating_challenge/widgets/circular_widget.dart';
import 'package:interactive_rating_challenge/widgets/rounded_centered_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBgColor,
      body: SafeArea(
        child: RoundedCenteredCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Hero(
                tag: 'animate',
                child: CircularWidget(
                  child: Icon(
                    Icons.star,
                    color: kSubmitBtnBgColor,
                  ),
                ),
              ),
              const Text(
                'How did we do?',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Please let us know how we did with your support request. All feedback is appreciated to help us improve our offering!',
                style: TextStyle(
                  color: kRatingBtnTextColor,
                  fontSize: 17,
                  letterSpacing: 0.1,
                  height: 1.3,
                ),
              ),
              _buildRatingBar(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildRatingBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        5,
        (index) => CircularWidget(
          isPressed: rating >= index,
          child: Text(
            '${index + 1}',
            style: buildButtonTextStyle(
              color: rating >= index ? Colors.white : kRatingBtnTextColor,
            ),
          ),
          onPressed: () {
            setState(() {
              if (rating == index) {
                rating = 0;
                return;
              }
              rating = index;
            });
          },
        ),
      ),
    );
  }

  SizedBox buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: kSubmitBtnBgColor,
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ThankYou(rating: rating + 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'SUBMIT',
            style: buildButtonTextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  TextStyle buildButtonTextStyle(
      {double fontSize = 18, Color color = kRatingBtnTextColor}) {
    return TextStyle(
      color: color,
      letterSpacing: 1.5,
      fontSize: fontSize,
    );
  }
}
