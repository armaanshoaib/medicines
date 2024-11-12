import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndMessage extends StatelessWidget {
  final double deviceHeight;
  TitleAndMessage(this.deviceHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: deviceHeight * 0.08,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: AutoSizeText(
              "MediSync",
              style: GoogleFonts.quicksand(
                textStyle: Theme.of(context).textTheme.displayLarge,

                color: const Color.fromARGB(255, 219, 196, 130),
                fontSize: 40,
                // fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              //   maxLines: 2,
            ),
          ),
        ),
        Container(
          height: deviceHeight * 0.25,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: AutoSizeText(
              "A smart solution for your medication responsibilities",
              style: GoogleFonts.quicksand(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: const Color.fromARGB(255, 150, 150, 150),

                fontSize: 25,
                // fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
