import 'package:flutter/material.dart';

import 'package:animate_do_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'twitter': (BuildContext context) => const TwitterScreen(),
    'navigation': (BuildContext context) => const NavigationScreen(),
  };
}
