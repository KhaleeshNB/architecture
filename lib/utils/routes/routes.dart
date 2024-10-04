import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmex/utils/routes/routes_name.dart';
import 'package:mvvmex/view/home_screen.dart';
import 'package:mvvmex/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
        case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen(),);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
