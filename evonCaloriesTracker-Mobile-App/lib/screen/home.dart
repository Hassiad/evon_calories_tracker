import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/user_passed_data_model.dart';
import '../utils/constants.dart';

var token;
FlutterSecureStorage storage = const FlutterSecureStorage();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

String? userNick;
String? username;
Widget? setwaitload;
String? dbItems;

class Userdata {
  String name;
  String amount;
  String wallet_name;
  Userdata(this.name, this.amount, this.wallet_name);

  // named constructor
  Userdata.fromJson(Map<String, dynamic> json)
      : name = json['message'],
        amount = json['status_code'],
        wallet_name = json['status_code'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'wallet_name': wallet_name,
    };
  }
}

String? amount;
String? textData;

class UserDetails {
  String? name;

  UserDetails({this.name});

  UserDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

String? userd;

class WalletInfo {
  String? statusCode;
  int? walletAmount;

  WalletInfo({this.statusCode, this.walletAmount});

  WalletInfo.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    walletAmount = json['walletAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status_code'] = statusCode;
    data['walletAmount'] = walletAmount;
    return data;
  }
}

class resd {
  String? statusCode;
  String? message;

  resd({this.statusCode, this.message});

  resd.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = statusCode;
    data['message'] = message;
    return data;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  void userprofile() async {
    /* var urls = Uri.parse('http://ec2-54-174-223-185.compute-1.amazonaws.com:3000/api/v1/users/me');
    var response = await http.get(urls,headers: <String, String>{
      'Content-Type': 'application/json',
      'x-api-key': '8129892',
      'Authorization': 'Bearer ${token}',
    });
    Map<String, dynamic> maps = jsonDecode(response.body);
    loginres resp = new  loginres.fromJson(maps);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('${response.body}');
    */
  }
  String? lar;
  String? greet;
  TextEditingController _textFieldController = new TextEditingController();

  void initState() {
    super.initState();
    String sam = DateFormat.jm().format(DateTime.now());

    setState(() {
      if (sam.contains("AM")) {
        greet = "Good Morning";
        print("${greet}");
      }
      if (sam.contains("PM")) {
        greet = "Good Evening";
        print("${greet}");
      }
    });
    print("${sam}");
    // userres();
    // Do something
    setwaitload = Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.green,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(45)),
            child: Image.asset(
              "assets/imageload.gif",
              height: 35,
              width: 35,
            ),
          ),
        ),
      ),
    );
    // _OnsubmitReg();
  }

  @override
  Widget build(BuildContext context) {
    //  this is the material super constructor for init state to link your instance initState to the global initState context
    var themeData = Theme.of(context);
    int selindex;
    selindex = 0;
    // String args = ModalRoute.of(context).settings.arguments;
    // // userSendDe = args;
    // Map<String, dynamic> maps = jsonDecode(args);
    // String args = ModalRoute.of(context)?.settings.arguments;
    // userSendDe = args;
    String? args = ModalRoute.of(context)?.settings.arguments as String?;
    Map<String, dynamic> maps = jsonDecode(args!);

    PassedData pers = PassedData.fromJson(maps);
    token = pers.token;
    userNick =
        '{"email":"${pers.email}","firstName":"${pers.firstName}","lastName":"${pers.lastName}","token":"${pers.token}"}';

    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, top: 45, right: 20, bottom: 20),
                      margin: EdgeInsets.only(top: 45),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 10),
                                blurRadius: 10),
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Thanks for your partronge',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Are you sure you want to exit from the app',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                    onPressed: () {
                                      exit(0);
                                    },
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 45,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                            child: Image.asset("assets/download.png")),
                      ),
                    ),
                  ],
                ),
              );
            });
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            leading: Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                );
              },
            ),
            title: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${greet}",
                    // 'Morning',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Hi,",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    " ${pers.firstName}  ${pers.lastName}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            actions: [
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.all(6),
                child: IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          backgroundColor: const Color(0xffeeeeee),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 26,
            ),
            child: Column(
              children: [
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 100,
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Rectangle30.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text('Wallet Balance',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          Text('N50,000',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_circle_down,
                                    color: Colors.white,
                                    size: 30.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Inflow",
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontSize: 12,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('N',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.white,
                                            fontSize: 15,
                                          )),
                                      Text('0',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 95,
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_circle_up,
                                    color: Colors.orange,
                                    size: 30.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Outflow",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      // fontSize: 12,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'N',
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text('0',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 800,
                  height: 110,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Rectangle31.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Text(''),
                ),
                // SizedBox(height: 20),

                Container(
                  width: 800,
                  height: 100,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/airtimedata.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: const Text(
                      'AIRTIME AND DATA',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AIRTIME_ROUTE,
                          arguments: args);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 800,
                  height: 100,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/handyman.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: const Text(
                      'HANDYMAN',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, HANDY_ROUTE,
                          arguments: args);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 800,
                  height: 100,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/estatedues.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: const Text(
                      'ESTATE DUES',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, HOME_ROUTE, arguments: args);
                    },
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  width: 800,
                  height: 100,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/teleweb.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: const Text(
                      'TELEWEB',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, TELEWEB_ROUTE,
                          arguments: args);
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selindex,
            onTap: (index) {
              if (index == 1) {
                Navigator.pushNamed(context, USER_PROFILE_UPDATE_ROUTE,
                    arguments: '$userNick');
              }
              if (index == 2) {
                Alert(
                  context: context,
                  type: AlertType.error,
                  title: "Login Out",
                  // desc: '${resp.message}',
                  desc: 'Do you really want to logout?',
                  buttons: [
                    DialogButton(
                      child: const Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pushNamed(context, LOGIN_ROUTE);
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                      width: 120,
                    )
                  ],
                ).show();

                // Navigator.pushNamed(context, LOGIN_ROUTE,
                //     arguments: '$userNick');
              }
              // if (index == 3) {
              //   Navigator.pushNamed(context, 'more', arguments: '$userNick');
              // }
            }, // this will be set when a new tab is tapped
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                label: 'Home',
                // backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                label: 'Profile',
                // activeIcon: Text('active Testing'),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.settings, color: Colors.red),
              //   label: 'Settings',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout, color: Colors.red),
                label: 'Logout',
              )
            ],
          ),
        ),
      ),
    );
  }
}
