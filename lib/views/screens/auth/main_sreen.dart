import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterprovider/views/screens/auth/login_screen.dart';
import 'package:flutterprovider/views/screens/home/on_board_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const onBoardScreen();
          } else {
            const LoginScreen();
          }

          return Container();
        },
      ),
    );
  }
}
