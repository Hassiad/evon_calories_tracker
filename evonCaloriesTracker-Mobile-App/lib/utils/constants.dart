import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constant/api.constant.dart';

// measurements
var smallTextScaleFactor = 1.0;
// UserModule get _userModule => store.getModule<UserModule>();
// User get _user => _userModule.user;
// routes
const HOME_ROUTE = '/home';
const LOGIN_ROUTE = '/login';
const TOPUP_ROUTE = '/topup';
const TOPUP_TRANS_ROUTE = '/topuptrans';
const CONTACT_ROUTE = '/contact';
const TERMS_OF_SERVICE_ROUTE = '/terms_of_service';
const PRIVACY_AND_POLICY_ROUTE = '/privacy_and_policy';
const CHANGE_PASSWORD_ROUTE = '/change_password';
const LOGOUT_ROUTE = '/logout';
const KYC_ROUTE = '/add_kyc';
const USER_PROFILE_UPDATE_ROUTE = '/user_profile';
const SPLASH_SCREEN_ROUTE = '/splash-screen';
const BANK_TRANSFER_ROUTE = '/send_money';
const ADD_BANK_BENEFICIARY_ROUTE = '/beneficiaries/bank/add';
const BANK_BENEFICIARIES_ROUTE = '/beneficiaries/bank';
const MESSAGE_LIST_ROUTE = '/message_history';
// const HOMEDASH_ROUTE = "/";
const SIGNUP_ROUTE = '/signup';
const SIGNUPINT_ROUTE = '/signupint';
const KYCINFO_ROUTE = '/kycinfo';
const KYCUPDATE_ROUTE = '/kycupdate';
const CONFIRMPASS_ROUTE = '/confirmpass';
const RESETPASSWORD_ROUTE = '/resetpassword';
const FORGOTPASSWORD_ROUTE = '/forgotpassword';
// const HOMEDASHED_ROUTE = '/home';
const AIRTIME_ROUTE = '/airtime';
const HANDY_ROUTE = '/handy';
const TELEWEB_ROUTE = '/teleweb';
const TELEWEB_SUBSCRIBER_FORM_ROUTE = '/telewebsubscriberform';
const TELEWEB_SUB_ROUTE = '/telewebsub';
const TELEWEB_CUSTOMER_ROUTE = '/telewebcustomer';
const TELEWEB_HOME_ROUTE = '/telewebhome';
const TELEWEB_SERVICES_ROUTE = '/telewebservices';
const TELEWEB_INVOICES_ROUTE = '/telewebinvoices';
const TELEWEB_PAYMENTS_ROUTE = '/telewepayments';
const TELEWEB_TOPUP_ROUTE = '/telewebtopup';
const TELEWEB_BOOSTER_ROUTE = '/telewebbooster';
const TELEWEB_LOGOUT_ROUTE = '/teleweblogout';
const TELEWEB_SERVICED_ROUTE = '/telewebserviced';
const TELEWEB_DATACAP_ROUTE = '/telewebdatacap';
const TELEWEB_SESSIONS_ROUTE = '/telewebsessions';
const TELEWEB_SESSIONS_HISTORY_ROUTE = '/telewebsessionshistory';
const HANDYREQ_ROUTE = '/handyreq';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
var useHide;
// navigation
var navMapList = [
  {
    'title': 'Home',
    'route': HOME_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'Top Up',
    'route': TOPUP_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'Top Up History',
    'route': TOPUP_TRANS_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'Contact Us',
    'route': CONTACT_ROUTE,
    'icon': 'assets/svgs/contact_us.svg',
  },
  {
    'title': 'Terms of Service',
    'route': TERMS_OF_SERVICE_ROUTE,
    'icon': 'assets/svgs/terms_of_service.svg',
  },
  {
    'title': 'Send Money',
    'route': BANK_TRANSFER_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'Update KYC',
    'route': KYC_ROUTE,
    'icon': 'assets/svgs/transactions.svg',
  },
  {
    'title': 'Privacy & Policy',
    'route': PRIVACY_AND_POLICY_ROUTE,
    'icon': 'assets/svgs/privacy_policy.svg',
  },
  {
    'title': 'Change Password',
    'route': CHANGE_PASSWORD_ROUTE,
    'icon': 'assets/svgs/lock.svg',
  },
  {
    'title': 'Log Out',
    'route': LOGOUT_ROUTE,
    'icon': 'assets/svgs/log_out.svg',
  }
];
var bottomNavList = [
  {
    'title': 'Home',
    'icon': Platform.isIOS ? CupertinoIcons.home : Icons.home,
    'route': HOME_ROUTE,
  },
  {
    'title': 'Top Up',
    'route': TOPUP_ROUTE,
    'icon': Platform.isIOS ? CupertinoIcons.money_dollar_circle : Icons.money,
  },
  {
    'title': 'Log Out',
    'route': LOGOUT_ROUTE,
    'icon': Icons.logout,
  }
];

var telewebNavMapList = [
  {
    'title': 'Home',
    'route': TELEWEB_HOME_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'Sevices',
    'route': TELEWEB_SERVICES_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'Invoices',
    'route': TELEWEB_INVOICES_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'Payments',
    'route': TELEWEB_PAYMENTS_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'TopUp',
    'route': TELEWEB_TOPUP_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  {
    'title': 'Booster',
    'route': TELEWEB_BOOSTER_ROUTE,
    'icon': 'assets/svgs/send_money.svg',
  },
  // {
  //   'title': 'Send Money',
  //   'route': BANK_TRANSFER_ROUTE,
  //   'icon': 'assets/svgs/send_money.svg',
  // },
  // {
  //   'title': 'Update KYC',
  //   'route': KYC_ROUTE,
  //   'icon': 'assets/svgs/transactions.svg',
  // },
  // {
  //   'title': 'Privacy & Policy',
  //   'route': PRIVACY_AND_POLICY_ROUTE,
  //   'icon': 'assets/svgs/privacy_policy.svg',
  // },
  // {
  //   'title': 'Change Password',
  //   'route': CHANGE_PASSWORD_ROUTE,
  //   'icon': 'assets/svgs/lock.svg',
  // },
  {
    'title': 'Log Out',
    'route': LOGOUT_ROUTE,
    'icon': 'assets/svgs/log_out.svg',
  }
];

dynamic dashboardGridNavMapList = [
  {
    'title': 'Airtime and Data',
    'icon': 'assets/svgs/send_money.svg',
    'route': AIRTIME_ROUTE,
  },
  {
    'title': 'Teleweb',
    'icon': 'assets/svgs/send_money.svg',
    'route': TELEWEB_ROUTE,
  },
  {
    'title': 'Handy Man',
    'icon': 'assets/svgs/send_money.svg',
    'route': HANDY_ROUTE,
  },
  {
    'title': 'Estate Dues',
    'icon': 'assets/svgs/send_money.svg',
    'route': HOME_ROUTE,
  },
];

dynamic telewebDashboardGridNavMapList = [
  {
    'title': 'Services',
    'icon': 'assets/svgs/send_money.svg',
    'route': TELEWEB_SERVICES_ROUTE,
  },
  {
    'title': 'Invoices',
    'icon': 'assets/svgs/send_money.svg',
    'route': TELEWEB_INVOICES_ROUTE,
  },
  {
    'title': 'Payments',
    'icon': 'assets/svgs/send_money.svg',
    'route': TELEWEB_PAYMENTS_ROUTE,
  },
  {
    'title': 'TopUp',
    'icon': 'assets/svgs/send_money.svg',
    'route': TELEWEB_TOPUP_ROUTE,
  },
  {
    'title': 'Booster',
    'icon': 'assets/svgs/send_money.svg',
    'route': TELEWEB_BOOSTER_ROUTE,
  },
  // {
  //   'title': 'Privacy & Policy',
  //   'icon': 'assets/svgs/privacy_policy.svg',
  //   'route': PRIVACY_AND_POLICY_ROUTE,
  // },
  // {
  //   'title': 'Change Password',
  //   'icon': 'assets/svgs/lock.svg',
  //   'route': CHANGE_PASSWORD_ROUTE,
  // },
];

// regex patterns and pattern strings
const BANK_ACCOUNT_PATTERN_STRING = r'^\d{10}$';
const METER_NUMBER_PATTERN_STRING = r'^\d{10,}$';
const PHONE_PATTERN_STRING = r'^(?:\+234|0)\d{10}$';

// error messages
const DEFAULT_SERVER_ERROR = 'Something went wrong';
const REQUIRED_VALUE_ERROR_MESSAGE = 'Value is required';
const INVALID_EMAIL_ERROR_MESSAGE = 'Invalid email address';
const INVALID_PHONE_NUMBER_ERROR_MESSAGE = 'Invalid phone number';
const INVALID_METER_NUMBER_ERROR_MESSAGE = 'Invalid meter number';
const INVALID_CABLE_TV_CARD_NUMBER_ERROR_MESSAGE = 'Invalid card number';
const INVALID_BANK_ACCOUNT_NUMBER_ERROR_MESSAGE = 'Invalid account number';
const METER_NUMBER_VERIFICATION_ERROR_MESSAGE = 'Unable to verify meter number';

/*
String computeAmountMinError(double min, [bool isDouble = true]) =>
    'Minimum value is ${formatNumber(value: min, decimalDigits: isDouble ? 2 : 0)}';
String computeAmountMaxError(double max, [bool isDouble = true]) =>
    'Maximum value is ${formatNumber(value: max, decimalDigits: isDouble ? 2 : 0)}';

 */

// api constants
const DROPDOWN_ITEM_PLACEHOLDER_INT_VALUE = -1000;
// const HETTY_API_BASE_URL = 'http://ec2-3-17-219-86.us-east-2.compute.amazonaws.com:3000/api'; // live
// const VERIFICATION_API_URL = 'http://ec2-3-17-219-86.us-east-2.compute.amazonaws.com:3000/api';

const HETTY_API_BASE_URL = 'https://api.hettysphere.com/api'; // live
const VERIFICATION_API_URL = 'https://api.hettysphere.com/api';

// const HETTY_API_BASE_URL = 'http://127.0.0.1:3000/api'; // live
// const VERIFICATION_API_URL = 'http://127.0.0.1:3000/api';
// validators

/*
final Function requiredValidator =
    Validators.required(REQUIRED_VALUE_ERROR_MESSAGE);
final List<FormFieldValidator<String>> phoneNumberFieldValidators = [
  requiredValidator,
  Validators.patternString(
      PHONE_PATTERN_STRING, INVALID_PHONE_NUMBER_ERROR_MESSAGE),
];

final List<FormFieldValidator<String>> emailFieldValidators = [
  requiredValidator,
  Validators.email(INVALID_EMAIL_ERROR_MESSAGE),
];
final List<FormFieldValidator<String>> bankAccountNumberFieldValidators = [
  requiredValidator,
  Validators.patternString(
      BANK_ACCOUNT_PATTERN_STRING, INVALID_BANK_ACCOUNT_NUMBER_ERROR_MESSAGE),
];

final List<FormFieldValidator<String>> meterNumberFieldValidators = [
  requiredValidator,
  Validators.patternString(
    METER_NUMBER_PATTERN_STRING,
    INVALID_METER_NUMBER_ERROR_MESSAGE,
  ),
];

List<FormFieldValidator<String>> getAmountValidator(
    {double min, double max, bool isDouble: true}) {
  return [
    requiredValidator,
    if (min != null) Validators.min(min, computeAmountMinError(min, isDouble)),
    if (max != null) Validators.max(max, computeAmountMaxError(max, isDouble)),
  ];
}

// blank validators

final Function blankRequiredValidator = Validators.required('');
final List<FormFieldValidator<String>> blankPhoneNumberFieldValidators = [
  blankRequiredValidator,
  Validators.patternString(PHONE_PATTERN_STRING, ''),
];
final List<FormFieldValidator<String>> blankPinFieldValidators = [
  blankRequiredValidator,
];
final List<FormFieldValidator<String>> blankEmailFieldValidators = [
  blankRequiredValidator,
  Validators.email(''),
];

*/

// design constants

const roundedTextFieldSizeBox = SizedBox(height: 35.0);
const telewebSubscriberFormSizeBox = SizedBox(height: 15.0);
const telewebSubscriberFormTextStyle =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400);

const appAccentColor = Color(0xffF9BA60);
SizedBox defaultFormFieldSeparator = SizedBox(height: 32);

// symbols
const DOLLAR_SYMBOL = '\$';
const NAIRA_SYMBOL = '₦';

// method channel names
const API_CONTENT_TYPE = 'application/x-www-form-urlencoded';
// other constants
const REMEMBER_ME_KEY = 'remember_me';
const GENDERS = const ['Male', 'Female'];
const USER_PHONE_KEY = 'user_phonenumber';
const OPERATION_TIME_KEY = 'operation_at';
// const OBSCURED_BALANCE_TEXT = '$DOLLAR_SYMBOL xxx,xxx.xx';
const OBSCURED_BALANCE_TEXT = '$NAIRA_SYMBOL xxx,xxx.xx';
const DEFAULT_SCREEN_PADDING =
    EdgeInsets.symmetric(vertical: 32, horizontal: 24);
const DEFAULT_DIALOG_CONTENT_PADDING =
    const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0);

// void a() {
//   Validators.patternRegExp(pattern, errorMessage)
// }
// Color primaryColorLT = Color(0xff423869);
Color primaryColorLT = const Color(0xffCE453B);
// Color accentColor = Color(0xffF9BA60);
Color accentColor = Color(0xffF93939);
Color hintColorW = Color(0xffAAAAAA);
Color hintColorC = Color(0xff707070);
Color errorColor = Color(0xffF93939);

Color successfulColor = Color(0xff2DCA36);
Color initiatedColor = Color(0xffffc107);
Color textAreaColor = Color(0xffF7F7F7);

Color topSubtitleColor = Color(0xffAAAAAA);
const double buttonHeight = 52.0;
const double buttonRadius = 30.0;

const int hex = 0xff423869;
// const Color primaryColorLT = Color(hex);

const Color textColor = Color(0xff383838);

const primarySwatch = MaterialColor(hex, {
  50: Color(hex),
  100: Color(hex),
  200: Color(hex),
  300: Color(hex),
  400: Color(hex),
  500: Color(hex),
  600: Color(hex),
  700: Color(hex),
  800: Color(hex),
  900: Color(hex),
});

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: accentColor,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(buttonRadius),
      ),
    ),
  ),
);
final headline5 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 26.0,
  fontFamily: 'Rubik',
);
final headline6 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  fontFamily: 'Rubik',
);
final subHeadline5 = TextStyle(
  color: Color(0xffAAAAAA),
  fontFamily: 'Rubik',
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
);
final bodyText1 = TextStyle(
  color: textColor,
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  fontFamily: 'CarosSoft',
);
final bodyText2 = TextStyle(
  color: textColor,
  fontFamily: 'CarosSoft',
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
);
final inputDecoration = InputDecoration(
  hintStyle: bodyText2.copyWith(color: hintColorW),
  border: InputBorder.none,
);

final inputDecorationSM = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColorLT, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: hintColorW, width: 1.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: hintColorW.withOpacity(0.5), width: 1.0),
  ),
  errorStyle: TextStyle(
    color: Colors.red, // or any other color
  ),
);

const loremIpsum =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    '\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    // size: 50.0,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kEmailTextInputDecoration = InputDecoration(
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
  // hintText: 'Your Pay day Email here',
  hintText: 'Email or Phone number',
  helperText: 'Please enter it correctly.',
  // labelText: 'Email or Phone number',
  prefixIcon: Icon(
    Icons.person,
    color: Colors.red,
  ),
);

// var kErrorMessage = Alert(
//   context: context,
//   type: AlertType.error,
//   title: "Unsuccessful Login",
//   desc: '${resp.message}',
//   buttons: [
//     DialogButton(
//       child: const Text(
//         "OK",
//         style: TextStyle(color: Colors.white, fontSize: 20),
//       ),
//       color: Colors.red,
//       onPressed: () {
//         Navigator.pop(context);
//         Navigator.pop(context);
//       },
//       width: 120,
//     )
//   ],
// ).show();

// const showModal = const showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         child: Center(
//           child: Image.asset('assets/loader.gif'),
//         ),
//       );
//     });

Future<void> responseWithData(
  BuildContext context,
  String apiEndpont,
  String httpMethod,
  dynamic apiModel,
  dynamic Data,
  dynamic passedData,
  dynamic apiResponse,
  dynamic screenRoute,
) async {
  // get and send the data to the api and get its response to the users.
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SpinKitDoubleBounce(
          color: Colors.red,
          size: 100.0,
        );
      });

  Map data = {};

  var urls = Uri.parse('${ApiUrls.baseUrl}$apiEndpont');
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
  apiResponse = apiModel.fromJson(maps);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  if (apiResponse.status == 'success') {
    var datalog = apiResponse.data;
    String? sd = apiResponse.token;

    // User? per = datalog?.user;

    print("$sd");
    passedData = {};
    //var pass =  '{"email":"${datalog?.email}","firstName":"${datalog?.firstName}","lastName":"${datalog?.lastName}","token":"$sd"}';
    print(passedData);

    Alert(
      context: context,
      type: AlertType.error,
      title: "Password Reset",
      desc: '${apiResponse.message}',
      buttons: [
        DialogButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.red,
          onPressed: () {
            Navigator.pushNamed(context, screenRoute, arguments: passedData);
            // Navigator.pushNamed(context, HOMEDASHED_ROUTE, arguments: pass);
            // Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();

    Navigator.pushNamed(context, screenRoute, arguments: passedData);
    // Navigator.push(context, MaterialPageRoute(builder: ()))
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (BuildContext context) => HOMEDASHED_ROUTE, arguments: pass));
  } else {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Unsuccessful Login",
      desc: '${apiResponse.message}',
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
