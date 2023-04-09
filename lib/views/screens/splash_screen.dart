import 'dart:async';
import 'dart:math';

import 'package:animal_database/helper/db_helper.dart';
import 'package:animal_database/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int i = 0;
  Random r = Random();

  @override
  void initState() {
    i = r.nextInt(5);
    Timer(
      const Duration(seconds: 3),
      () {
        Route newRoute = MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
        Navigator.of(context).pushReplacement(newRoute);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: DBHelpers.dbHelpers.fetchRecord(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Text(
                "${snapShot.hasError}",
              );
            } else if (snapShot.hasData) {
              var data = snapShot.data;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(data[i]['image']),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      data[i]['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    LoadingAnimationWidget.twistingDots(
                      size: 200,
                      leftDotColor: Colors.pink,
                      rightDotColor: Colors.orangeAccent,
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
