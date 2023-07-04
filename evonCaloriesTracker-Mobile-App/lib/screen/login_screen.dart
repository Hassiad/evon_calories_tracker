import 'dart:convert';

import 'package:evon_calories_tracker/constant/api.constant.dart';
// import 'package:evon_calories_tracker/models/loginres.dart';
import 'package:evon_calories_tracker/models/user_response_model.dart';
import 'package:evon_calories_tracker/screen/forgotpassword_screen.dart';
import 'package:evon_calories_tracker/utils/button_text.dart';
import 'package:evon_calories_tracker/utils/rounded_button.dart';
import 'package:evon_calories_tracker/utils/rounded_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // @override
  var _useEmail = false;
  var _usehide = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final storage = const FlutterSecureStorage();

  Future<void> login_sumbit() async {
    // get and send the data to the api and get its response to the users.
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return const SpinKitDoubleBounce(
    //         color: Colors.red,
    //         size: 100.0,
    //       );
    //     });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Center(
              child: Image.asset('assets/loader.gif'),
            ),
          );
        });

    Map data = {
      "email": _emailController.text,
      "password": _passwordController.text
    };

    var urls = Uri.parse('${ApiUrls.baseUrl}users/login');
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
    UserResponse resp = UserResponse.fromJson(maps);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (resp.status == 'success') {
      Data? per = resp.data;
      String? sd = resp.token;

      // User? per = datalog?.user;

      print(per?.accountId);

      // print("$sd");
      await storage.write(key: 'token', value: sd);
      await storage.write(key: 'accountID', value: per?.accountId);
      await storage.write(key: 'firstName', value: per?.firstName);
      await storage.write(key: 'lastName', value: per?.lastName);
      await storage.write(key: 'level', value: per?.level);
      // // String? value = await storage.read(key: key);
      // var pass =
      //     '{"email":"${per?.email}","firstName":"${per?.firstName}","lastName":"${per?.lastName}","token":"$sd"}';
      // print(pass);
      Navigator.pushNamed(context, HOME_ROUTE);
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Unsuccessful Login",
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
                bottom: 70.0,
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
            Form(
              child: Column(
                children: [
                  RoundedTextFormField(
                    controller: _emailController,
                    obscureText: false,
                    icon: Icons.email,
                    labelText: 'Email or Phone number',
                    hintText: 'you@examplemail.com',
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.compose([
                      Validators.required('Email is required'),
                      Validators.email('Invalid email address'),
                    ]),
                  ),
                  roundedTextFieldSizeBox,
                  RoundedTextFormField(
                    obscureText: _usehide,
                    suffixIcon: IconButton(
                      icon: Icon(
                          _usehide ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _usehide = !_usehide;
                        });
                      },
                    ),
                    controller: _passwordController,
                    icon: Icons.lock,
                    labelText: 'Password',
                    hintText: 'Pass123#@2w',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                  roundedTextFieldSizeBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedButton(
                        buttonText: 'LOGIN',
                        onPressed: () {
                          // if (!_formKey.currentState.validate()) return;
                          login_sumbit();
                          // if (_formKey.currentState.validate()) {
                          //   // hide the keyboard programmatically
                          //   // FocusScope.of(context).unfocus();
                          //   login_sumbit();
                          // }
                          // if (_formKey.currentState != null) {
                          //   _formKey.currentState?.validate();
                          //   login_sumbit();
                          // }
                        },
                        foregroundColour:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColour:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      RoundedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ForgotPasswordScreen(),
                            ),
                          );
                        },
                        buttonText: 'Forgot Password',
                        foregroundColour:
                            MaterialStateProperty.all<Color>(Colors.red),
                        backgroundColour:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 75.0,
            ),
            ButtonText(
              onPressed: () {
                Navigator.pushNamed(context, SIGNUP_ROUTE);
              },
              text: 'Don\'t have an account?',
              buttonText: 'Sign Up',
            ),
          ],
        ),
      ),
    ));
  }
}
