import 'package:audi_pmil/controller/forgot_password/forgot_password_controller.dart';
import 'package:audi_pmil/controller/login/login_controller.dart';
import 'package:audi_pmil/controller/transcactio_controller/transaction_controller.dart';
import 'package:audi_pmil/resource/style.dart';
import 'package:provider/provider.dart';
import 'package:audi_pmil/utils/routes/route_name.dart';
import 'package:audi_pmil/utils/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginController>(create: (context) {
      return LoginController();
    }),

    ChangeNotifierProvider<ForgotPasswordController>(create: (context) {
      return ForgotPasswordController();
    }),
    ChangeNotifierProvider<TransactionController>(create: (context) {
      return TransactionController();
    }),
  ], child:const  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: myIconTheme,
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: myElevatedButtonStyle),
        colorScheme: mainColorScheme,
        appBarTheme: const AppBarTheme(
          titleTextStyle: appBarTextStyle,
        ),
        textTheme: const TextTheme(
          subtitle1: titleTextStyle,
          bodyText1: bodyTextStyle,
        ),
        tabBarTheme: myTabBarTheme,
      ),
      initialRoute: RouteName.homeScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
