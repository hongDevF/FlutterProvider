import 'package:flutter/material.dart';
import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/views/screens/auth/login_screen.dart';
import 'package:flutterprovider/views/screens/card/create_card_screen.dart';
import 'package:flutterprovider/views/screens/card/super_card.dart';
import 'package:flutterprovider/views/screens/home/home_screen1.dart';
import 'package:flutterprovider/views/screens/home/images/full_image_screen.dart';
import 'package:flutterprovider/views/screens/home/splash_screen.dart';
import 'package:flutterprovider/views/screens/product/product_screen.dart';

import 'package:flutterprovider/views/screens/product_screen.dart';
import 'package:flutterprovider/views/screens/todo_screen.dart';
import '../views/screens/home/images/image_screen.dart';
import '../views/screens/home/on_board_screen.dart';
import '../views/screens/setting/setting_screen.dart';
import '../views/screens/home/user_screen.dart';

class RouteClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final settings
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (context) => const SettingScreen());
      case RouteNames.home1:
        return MaterialPageRoute(builder: (context) => const HomeScreen1());
      case RouteNames.onboard:
        return MaterialPageRoute(builder: (context) => const onBoardScreen());
      case RouteNames.user:
        return MaterialPageRoute(builder: (context) => const UserScreen());
      case RouteNames.addProduct:
        return MaterialPageRoute(builder: (context) => const ProductScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteNames.todo:
        return MaterialPageRoute(builder: (context) => const TodoScreen());
      case RouteNames.imgscr:
        return MaterialPageRoute(builder: (context) => const ImageView());
      case RouteNames.fImg:
        return MaterialPageRoute(builder: (context) => const FullImageScreen());
      case RouteNames.spl:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.product:
        return MaterialPageRoute(
            builder: (context) => const ProductScreenList());
      case RouteNames.card:
        return MaterialPageRoute(builder: (context) => const SuperCard());
      case RouteNames.create_card:
        return MaterialPageRoute(
            builder: (context) => const CreateCardScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No have a page!!")),
          );
        });
    }
  }
}
