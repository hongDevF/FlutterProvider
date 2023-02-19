import 'package:flutter/material.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> nextScreen() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            CO_BLUE,
            CO_RED,
            CO_GOLD,
          ],
        ),
      ),
      child: Lottie.asset('lib/assets/images/lotties/loading_rounded.json'),
    );
  }
}
