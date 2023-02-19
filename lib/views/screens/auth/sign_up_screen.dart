// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterprovider/services/auth_service.dart';

import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_button.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:flutterprovider/views/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../routes/route_name.dart';
import '../../../view_models/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void createUser(String email, String password) async {
    AuthViewModel authViewModel =
        Provider.of<AuthViewModel>(context, listen: false);
    try {
      if (await authViewModel.CreateUser(email, password)) {
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        print('Create user faild!');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CO_WHITE,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Lottie.asset('lib/assets/images/lotties/register.json',
                  width: 200),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'FLUTTER \nPROVIDER',
                  Roboto_Slap: true,
                  color: CO_MEDIUMVIOLETRED,
                  textSize: 40,
                  istitle: true,
                ),
              ),
              CustomText(
                text: 'SIGNUP',
                istitle: true,
                textSize: 30,
              ),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: customTextField(
              //       controller: emailController,
              //       hintText: 'name',
              //     )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customTextField(
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
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: customButton(
                    onPress: () => createUser(
                        emailController.text, passwordController.text),
                    btnName: 'Create',
                    bColor: CO_BLUE,
                    borderRadius: 20,
                    color: CO_WHITE,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
