import 'package:flutter/material.dart';

import '../screen/home/screen_home.dart';
import '../screen/login/screen_login.dart';
import '../screen/siginup/screen_siginup.dart';
import '../screen/splash/screen_splash.dart';

class MdqAppRouteConstants {
  String splash = 'splash';
  String login = 'login';
  String siginup = 'siginup';
  String home = 'home';
}

Map<String, Widget Function(BuildContext)> MedqAppRoute =
    <String, WidgetBuilder>{
  MdqAppRouteConstants().splash: (context) => ScreenSplash(),
  MdqAppRouteConstants().login: (context) => ScreenLogin(),
  MdqAppRouteConstants().home: (context) => ScreenHome(),
  MdqAppRouteConstants().siginup: (context) => ScreenSiginup(),
};
