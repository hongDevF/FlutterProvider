// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/utils/utils.dart';
import 'package:flutterprovider/view_models/auth_view_model.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_button.dart';
// import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:provider/provider.dart';

import '../../../view_models/theme_changer_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = AuthViewModel();
    final themeChangeProvider = Provider.of<ThemeChangerProvider>(context);

    final ThemeMode themeMode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CO_BLUE,
      ),
      drawer: const Drawer(
          // backgroundColor: LIGHTYELLOW,
          ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text("Ligh Mode"),
            value: ThemeMode.light,
            groupValue: themeChangeProvider.themeMode,
            onChanged: themeChangeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeChangeProvider.themeMode,
            onChanged: themeChangeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text("System mode"),
            value: ThemeMode.system,
            groupValue: themeChangeProvider.themeMode,
            onChanged: themeChangeProvider.setTheme,
          ),
          ElevatedButton(
            onPressed: () {
              Utils.toastMessage(
                msg: 'Testing',
                bg: Colors.green.shade400,
              );
              Navigator.pushNamed(context, RouteNames.user);
            },
            child: Text("TO USER PAGE"),
          ),
          ElevatedButton(
            onPressed: () {
              // Utils.toastMessage(
              //   msg: 'Testing',
              //   bg: Colors.green.shade400,
              // );
              Navigator.pushNamed(context, RouteNames.addProduct);
            },
            child: Text("Add Product"),
          ),
          customButton(
              onPress: () => Navigator.pushNamed(context, RouteNames.todo),
              btnName: 'TODO VIEW'),
          // customButton(onPress: authViewModel.signOut, btnName: 'SignOut'),
        ],
      ),
    );
  }
}
