import 'package:flutter/material.dart';
import '../constants/image_constants.dart';
import '../utils/routes.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, Routes.HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: SizedBox(
            height: 350,
            child: Image.asset(ImageConstants.imageSplashScreen),
          ),
        ),
      ],
    ));
  }
}
