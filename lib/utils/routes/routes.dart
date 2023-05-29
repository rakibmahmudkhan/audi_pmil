
import 'package:audi_pmil/screens/charging_screen.dart';
import 'package:audi_pmil/screens/map_screen.dart';
import 'package:audi_pmil/screens/prepaid_screen.dart';
import 'package:audi_pmil/utils/routes/route_name.dart';
import 'package:flutter/material.dart';

import '../../screens/car_picking_screen.dart';
import '../../screens/current_account.dart';
import '../../screens/forgot_password.dart';
import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';



class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {

  /*    case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());*/
        case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => LogInScreen());
        case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        case RouteName.currentAccount:
        return MaterialPageRoute(builder: (_) => CurrentAccount());
        case RouteName.mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());
      case RouteName.carPickingScreen:
        return MaterialPageRoute(builder: (_) => ChargingScreen());
      case RouteName.chargingScreen:
        return MaterialPageRoute(builder: (_) =>   ChargingScreen());
        case RouteName.prepaidScreen:
        return MaterialPageRoute(builder: (_) => PrepaidScreen());

      /*    case RouteName.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());*/
      case RouteName.forgotScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}