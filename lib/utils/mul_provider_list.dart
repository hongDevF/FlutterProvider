import 'package:flutterprovider/models/language_model.dart';
import 'package:flutterprovider/view_models/auth_view_model.dart';
import 'package:flutterprovider/view_models/image_view_model.dart';
import 'package:flutterprovider/view_models/product_view_model.dart';
import 'package:flutterprovider/view_models/product_viewmodel.dart';
import 'package:flutterprovider/view_models/theme_changer_provider.dart';
import 'package:flutterprovider/view_models/todo_view_model.dart';
import 'package:flutterprovider/view_models/university_provider.dart';
import 'package:flutterprovider/view_models/user_view_model.dart';
import 'package:flutterprovider/view_models/userviewmodel.dart';
import 'package:flutterprovider/views/theme/theme_setting.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => UserModelProvider()),
  ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
  ChangeNotifierProvider(create: (_) => ProductNotifier()),
  ChangeNotifierProvider(create: (_) => TodoViewModel()),
  ChangeNotifierProvider(create: (_) => ImageViewModel()),
  ChangeNotifierProvider(create: (_) => ProductViewModel()),
  // ChangeNotifierProvider(create: (_) => UserNotify()),
  ChangeNotifierProvider(create: (_) => AuthViewModel()),
  ChangeNotifierProvider(create: (_) => ThemeSetting()),
  ChangeNotifierProvider(create: (_) => UniversityProvider()),

  ChangeNotifierProvider(create: (_) => LanguageModel()),
];
