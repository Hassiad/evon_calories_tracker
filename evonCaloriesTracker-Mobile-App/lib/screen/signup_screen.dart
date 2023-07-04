import 'dart:convert';

import 'package:evon_calories_tracker/constant/api.constant.dart';
import 'package:evon_calories_tracker/models/loginres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../utils/constants.dart';
import '../utils/rounded_text_form_field.dart';

class Signup_Screen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<Signup_Screen> {
  TextInputType Textvaluetype = TextInputType.emailAddress;

  final storage = const FlutterSecureStorage();
  // @override
  var _useEmail = false;
  var _usehide = true;
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var userName;
  var email;
  var password;
  var cpassword;

  Future<void> signup_sumbit() async {
    // get and send the data to the api and get its response to the users.
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SpinKitDoubleBounce(
            color: Colors.red,
            size: 100.0,
          );
        });

    Map data = {
      "userName": _userNameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "passwordConfirm": _confirmPasswordController.text,
    };

    var urls = Uri.parse('${ApiUrls.baseUrl}users/signup');
    var body = json.encode(data);
    print('Res : ${body}');
    var response = await http.post(urls,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: body);

    Map<String, dynamic> maps = jsonDecode(response.body);
    loginres resp = loginres.fromJson(maps);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (resp.status == 'success') {
      Data? datalog = resp.data;
      String? sd = resp.token;

      User? per = datalog?.user;

      await storage.write(key: 'token', value: sd);

      print("$sd");
      var pass =
          '{"email":"${per?.email}","firstName":"${per?.firstName}","lastName":"${per?.lastName}","token":"$sd"}';
      print(pass);

      Alert(
        context: context,
        type: AlertType.success,
        title: "Successful Signup",
        desc: '${resp.message}',
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, HOME_ROUTE, arguments: pass);
              // Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();

      // Navigator.pushNamed(context, HOMEDASHED_ROUTE, arguments: pass);
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Unsuccessful Signup",
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
                bottom: 20.0,
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
                    obscureText: false,
                    controller: _userNameController,
                    icon: Icons.person,
                    labelText: 'User Name',
                    hintText: 'Your User Name',
                  ),
                  roundedTextFieldSizeBox,
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
                    controller: _passwordController,
                    obscureText: true,
                    icon: Icons.lock,
                    labelText: 'Password',
                    hintText: 'Pass123#@2w',
                    textInputAction: TextInputAction.done,
                  ),
                  roundedTextFieldSizeBox,
                  RoundedTextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    icon: Icons.lock,
                    labelText: 'Confirm Password',
                    hintText: 'Pass123#@2w',
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 45.0)
                ],
              ),
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
            const SizedBox(height: 35.0),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              // width: 100.0,
              child: ElevatedButton(
                onPressed: () {
                  signup_sumbit();
                },
                child: Text(
                  "SIGN UP".toUpperCase(),
                  style: const TextStyle(fontSize: 14),
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
          ],
        ),
      ),
    ));
  }
}
