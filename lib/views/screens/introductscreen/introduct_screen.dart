import 'package:flutter/material.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductScreen extends StatefulWidget {
  const IntroductScreen({super.key});

  @override
  State<IntroductScreen> createState() => _IntroductScreenState();
}

class _IntroductScreenState extends State<IntroductScreen> {
final introKey = GlobalKey<IntroductionScreenState>();
  
 
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: CO_WHITE,
      pages: [
        PageViewModel(
          
        ),
      ],
    );
  }
}
