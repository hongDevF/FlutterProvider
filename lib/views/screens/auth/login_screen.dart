// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, unused_local_variable, unrelated_type_equality_checks, non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/view_models/auth_view_model.dart';
import 'package:flutterprovider/views/screens/auth/sign_up_screen.dart';
import 'package:flutterprovider/views/screens/home/on_board_screen.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_button.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:flutterprovider/views/widgets/custom_text_button.dart';
import 'package:flutterprovider/views/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final AuthService authService = AuthService();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void Login(String email, String password) async {
    AuthViewModel authViewModel =
        Provider.of<AuthViewModel>(context, listen: false);
    try {
      if (await authViewModel.signIn(email, password)) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => onBoardScreen()));
      } else {
        Navigator.pushNamed(context, RouteNames.login);
      }
    } on FirebaseAuthException catch (e) {
      throw '$e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child:
                      Lottie.asset('lib/assets/images/lotties/register.json')),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'FLUTTER PROVIDER',
                Roboto_Slap: true,
                textSize: 30,
                color: CO_DARKBLUE,
                istitle: true,
              ),
              CustomText(
                text: 'LOGIN',
                textSize: 30,
                istitle: true,
              ),
              SizedBox(
                height: 20,
              ),
              // _isEmpty
              //     ? CustomText(
              //         text: 'Email or password incorrect',
              //         color: CO_RED,
              //         textSize: 20,
              //         Roboto_Slap: true,
              //       )
              //     : Container(),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customTextField(
                    textError: 'please in email',
                    controller: emailController,
                    hintText: 'email',
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customTextField(
                  controller: passwordController,
                  hintText: 'password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: customButton(
                    onPress: () =>
                        Login(emailController.text, passwordController.text),
                    btnName: 'Login',
                    bColor: CO_BLUE,
                    borderRadius: 20,
                    color: CO_WHITE,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'no have an account yet?',
                    color: CO_BLACK,
                  ),
                  CustomTextButton(
                    name: 'SingUp',
                    color: CO_BLUE,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
