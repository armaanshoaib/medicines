import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../helpers/platform_flat_button.dart';
import '../../screens/welcome/title_and_message.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    void goToHomeScreen() => Navigator.pushReplacementNamed(context, "/home");

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: deviceHeight * 0.08,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 25.0),
                child: AutoSizeText(
                  "Health is Wealth",
                  style: GoogleFonts.quicksand(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    color: const Color.fromARGB(255, 150, 150, 150),
                    fontSize: 30,
                    // fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  //   maxLines: 2,
                ),
              ),
            ),
            Image.asset('assets/images/welcome_image.png',
                width: double.infinity, height: deviceHeight * 0.3),
            TitleAndMessage(deviceHeight),
            Container(
              height: deviceHeight * 0.09,
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: PlatformFlatButton(
                    handler: goToHomeScreen,
                    color: Colors.blue.withOpacity(0.7),
                    buttonChild: FittedBox(
                      child: Text(
                        "Start Medi-Syncing",
                        style: GoogleFonts.quicksand(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.white,
                          fontSize: 25,
                          // fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )),
            ),
            Container(
              height: deviceHeight * 0.08,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 25.0),
                child: AutoSizeText(
                  "IOMP by Armaan Shoaib 21261A05C0",
                  style: GoogleFonts.openSans(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    color: const Color.fromARGB(255, 238, 255, 0),
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                  //   maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
