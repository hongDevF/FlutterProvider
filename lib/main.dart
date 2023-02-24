// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterprovider/firebase_options.dart';
import 'package:flutterprovider/utils/mul_provider_list.dart';
import 'package:flutterprovider/view_models/theme_changer_provider.dart';
import 'package:flutterprovider/routes/route_class.dart';
import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(builder: (context) {
        final themeState = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeState.themeMode,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(),
            ),
            useMaterial3: true,
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            primaryColor: CO_DARKRED,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            // primarySwatch: Colors.amber,
            primaryColor: CO_DARKBLUE,
            primarySwatch: Colors.blue,
          ),
          initialRoute: RouteNames.onboard,
          onGenerateRoute: RouteClass.generateRoute,
        );
      }),
    );
  }
}
