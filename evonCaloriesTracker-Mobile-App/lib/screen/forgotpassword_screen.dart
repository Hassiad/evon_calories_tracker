/*
/// Main function.
void main() {
  runApp(const MyApp());
}

/// Example app widget.
class MyApp extends StatelessWidget {
  /// Main app widget.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Login',
      theme: ThemeData(
          primarySwatch: Colors.blue), //const MaterialColor(0xFF6666FF, color)
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginScreen(),
        '/forgotPass': (BuildContext context) => const ForgotPasswordScreen(),
      },
    );
  }

// static const Map<int, Color> color = {
//   50: Color.fromRGBO(4, 131, 184, .1),
//   100: Color.fromRGBO(4, 131, 184, .2),
//   200: Color.fromRGBO(4, 131, 184, .3),
//   300: Color.fromRGBO(4, 131, 184, .4),
//   400: Color.fromRGBO(4, 131, 184, .5),
//   500: Color.fromRGBO(4, 131, 184, .6),
//   600: Color.fromRGBO(4, 131, 184, .7),
//   700: Color.fromRGBO(4, 131, 184, .8),
//   800: Color.fromRGBO(4, 131, 184, .9),
//   900: Color.fromRGBO(4, 131, 184, 1),
// };
}*/

import 'dart:convert';

import 'package:evon_calories_tracker/constant/api.constant.dart';
import 'package:evon_calories_tracker/models/response_no_data.dart';
import 'package:evon_calories_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextInputType Textvaluetype = TextInputType.emailAddress;

  // @override
  var _useEmail = false;
  var _usehide = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  // final _phoneController = TextEditingController();
  // final _passwordController = TextEditingController();

  Future<void> forgotPassword() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SpinKitDoubleBounce(
            color: Colors.red,
            size: 100.0,
          );
        });

    Map data = {
      "email": _emailController.text,
      // "password": "${_passwordController.text}"
    };

    var urls = Uri.parse('${ApiUrls.baseUrl}users/forgotPassword');
    var body = json.encode(data);
    print('Res : ${body}');
    var response = await http.post(urls,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: body);
    // var snackBar = SnackBar(content: Text('Yay! A SnackBar! this ${response.body}'),);
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Map<String, dynamic> maps = jsonDecode(response.body);
    ResponseWithNoData resp = ResponseWithNoData.fromJson(maps);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (resp.status == 'success') {
      // Data? datalog = resp.data;
      // String? sd = resp.token;
      //
      // User? per = datalog?.user;
      //
      // print("$sd");
      // var pass =
      //     '{"email":"${per?.email}","firstName":"${per?.firstName}","lastName":"${per?.lastName}","token":"$sd"}';
      // print(pass);
      Alert(
        context: context,
        type: AlertType.success,
        title: "Forgot Password",
        desc: resp.message,
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, RESETPASSWORD_ROUTE,
                  arguments: '{"email":"$_emailController.text",}');
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Forgot Password",
        desc: '${resp.message}',
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Colors.red,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 100.0,
              ),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/evon_calories_tracker.jpg'),
                  fit: BoxFit.fitWidth,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _emailController,
                keyboardType: Textvaluetype,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffffff),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(width: 1, color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  hintText: 'you@examplemail.com',
                  // hintText: 'Email or Phone number',
                  // helperText: 'Please enter it correctly.',
                  labelText: 'evon_calories_tracker Email Address',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 75.0),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              // width: 100.0,
              child: ElevatedButton(
                onPressed: () {
                  forgotPassword();
                },
                child: Text(
                  "Send Token".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(Size(250.0, 50.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 65.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LOGIN_ROUTE);
                  },
                  child: Text(
                    'Login'.toUpperCase(),
                  ),
                )
              ],
            ),
            // const SizedBox(height: 35.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {
            //         forgot_password();
            //       },
            //       child: Text(
            //         "LOGIN".toUpperCase(),
            //         style: const TextStyle(fontSize: 14),
            //       ),
            //       // Row(
            //       //   children: [
            //       //     const Icon(
            //       //       Icons.lock,
            //       //       color: Colors.white,
            //       //     ),
            //       //     Text("LOGIN".toUpperCase(),
            //       //         style: const TextStyle(fontSize: 14)),
            //       //   ],
            //       // ),
            //       style: ButtonStyle(
            //         foregroundColor:
            //             MaterialStateProperty.all<Color>(Colors.white),
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(Colors.red),
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50.0),
            //             side: const BorderSide(color: Colors.red),
            //           ),
            //         ),
            //       ),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Text("Forgot Password".toUpperCase(),
            //           style: const TextStyle(fontSize: 14)),
            //       style: ButtonStyle(
            //         foregroundColor:
            //             MaterialStateProperty.all<Color>(Colors.red),
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(Colors.white),
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50.0),
            //             side: const BorderSide(color: Colors.red),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 75.0,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       'Don\'t have an account?',
            //       style: TextStyle(color: Colors.black, fontSize: 17.0),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, SIGNUP_ROUTE);
            //       },
            //       child: Text(
            //         'Sign Up'.toUpperCase(),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    ));
  }
}
