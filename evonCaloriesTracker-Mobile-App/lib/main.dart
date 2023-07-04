import 'package:evon_calories_tracker/screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'screen/forgotpassword_screen.dart';
import 'screen/login_screen.dart';
// import 'screen/resetpassword_screen.dart';
import 'screen/signup_screen.dart';
import 'screen/splash_screen.dart';
import 'utils/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'evon_calories_tracker',
      theme: ThemeData(
        // primarySwatch: Colors.white,
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.green,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
                minimumSize: MaterialStateProperty.all(Size(120, 50)))),
      ),
      // initialRoute: SPLASH_SCREEN_ROUTE,
      initialRoute: LOGIN_ROUTE,
      // onUnknownRoute: (context) => MaterialPageRoute(
      //   builder: (context) => const LoginScreen(),
      // ),
      routes: {
        HOME_ROUTE: (context) => const HomeScreen(),
        LOGIN_ROUTE: (context) => const LoginScreen(),
        SIGNUP_ROUTE: (context) => Signup_Screen(),
        SPLASH_SCREEN_ROUTE: (context) => SplashScreen(),
        FORGOTPASSWORD_ROUTE: (context) => const ForgotPasswordScreen(),
        // RESETPASSWORD_ROUTE: (context) => const ResetPassword(),
      },
    );
  }
}
