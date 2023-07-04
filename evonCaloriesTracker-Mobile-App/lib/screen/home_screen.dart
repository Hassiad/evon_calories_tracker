import 'dart:convert';

import 'package:avatar_view/avatar_view.dart';
import 'package:evon_calories_tracker/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constant/api.constant.dart';
import '../models/user_response_model.dart';
import '../utils/constants.dart';
import '../widgets/home_actions_grid.dart';
import '../widgets/home_user_account_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  int selindex = 0;
  String? firstName = "...";
  String? lastName = "...";
  String? email = "...";
  String? phoneNumber = "...";
  String? accountId = "...";
  String? profileImageURL;
  String? profileImagePlaceHolder =
      'https://kycdocumentsuploads.s3.amazonaws.com/default.jpg';
  String? level;
  String? kycVerified;

  Future<void> userprofile() async {
    String? token = await storage.read(key: 'token');
    print('TOKEN VALUE: $token');
    var urls = Uri.parse('${ApiUrls.baseUrl}users/me');
    var response = await http.get(urls, headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> maps = jsonDecode(response.body);
    UserResponse resp = UserResponse.fromJson(maps);
    Data? user = resp.data;

    // level = user?.level;
    // kycVerified = user?.kycVerified;
    //
    // print('KYC Level: $kycVerified');

    setState(() {
      // var details = user;
      level = user?.level;
      firstName = user?.firstName;
      lastName = user?.lastName;
      phoneNumber = user?.phoneNumber;
      accountId = user?.accountId;
      profileImageURL = user?.profileImageURL;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      await userprofile();
      // await telewebSub();
    });
  }

  Widget profilePhoto = Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(50),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // backgroundColor: Colors.red,
        child: ListView(
          children: <Widget>[
            Row(
              children: [
                DrawerHeader(
                  // decoration: BoxDecoration(color: Colors.red),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        // child: profilePhoto,
                        radius: 50.0,
                        child: AvatarView(
                          radius: 50,
                          borderColor: Colors.grey,
                          avatarType: AvatarType.CIRCLE,
                          backgroundColor: Colors.red,
                          imagePath: (profileImageURL ??
                              profileImagePlaceHolder) as String,
                          placeHolder: const Icon(
                            Icons.person,
                            size: 50,
                          ),
                          errorWidget: const Icon(
                            Icons.error,
                            size: 50,
                          ),
                        ),
                        // CircleAvatar(
                        //   radius: 50,
                        //   // backgroundImage: profileImageURL as ImageProvider,
                        //   backgroundImage: profileImageURL == null
                        //       ? const AssetImage(
                        //           'assets/default.jpg',
                        //           // width: double.infinity,
                        //           // fit: BoxFit.cover,
                        //         ) as ImageProvider
                        //       : profileImageURL as ImageProvider,
                        // ),
                      ),
                      const SizedBox(height: 10),
                      Text('$firstName $lastName'),
                    ],
                  ),
                ),
                const SizedBox(width: 120.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      // margin: const EdgeInsets.only(top: 0.0, right: 0.0),
                      child: closeButton(context),
                    ),
                  ],
                ),
              ],
            ),
            // const Divider(),
            ListTile(
              title: const Text("Teleweb"),
              leading: const Icon(
                Icons.fiber_smart_record,
                color: Colors.red,
              ),
              onTap: () {
                // Navigator.pushAndRemoveUntil<void>(
                //   context,
                //   MaterialPageRoute<void>(
                //       builder: (BuildContext context) => const TelewebScreen()),
                //   ModalRoute.withName('/home'),
                // );
                Navigator.pushNamed(context, TELEWEB_ROUTE);
              },
            ),
            ListTile(
              title: const Text("HandyMan"),
              leading: const Icon(
                Icons.handyman,
                color: Colors.red,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Estate Due"),
              leading: const Icon(
                Icons.real_estate_agent,
                color: Colors.red,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Airtime Data"),
              leading: const Icon(
                Icons.telegram,
                color: Colors.red,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Logout"),
              leading: const Icon(
                Icons.power_settings_new,
                color: Colors.red,
              ),
              onTap: logout,
            ),
          ],
        ),
      ),
      // drawer: NavigationDrawer(context: context).renderNavDrawer(),
      appBar: AppBar(
        // backgroundColor: Colors.red,
        backgroundColor: const Color(0xff222222),
        title: const Text('evon_calories_tracker'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      // appBar: ,
      // drawer: NavigationDrawer(context: context).renderNavDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          HomeAccountCards(),
          Expanded(
            child: HomeActionsGrid(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: const Color(0xff222222),
        type: BottomNavigationBarType.fixed,
        currentIndex: selindex,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, USER_PROFILE_UPDATE_ROUTE);
          }
          if (index == 2) {
            logout();
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
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   child: SizedBox(
      //     height: 60,
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           IconButton(
      //             icon: const Icon(Icons.home),
      //             color: Colors.red,
      //             onPressed: () {
      //               setState(() {
      //                 // currentState = 0;
      //               });
      //             },
      //             iconSize: 40,
      //           ),
      //           IconButton(
      //             icon: const Icon(Icons.person),
      //             color: Colors.red,
      //             onPressed: () {
      //               setState(() {
      //                 // currentState = 1;
      //               });
      //             },
      //             iconSize: 40,
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget closeButton(context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        // print('_AppDrawerState.closeButton');
        Navigator.of(context).pop();
      },
    );
  }

  void logout() async {
    await storage.delete(key: "token");
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
            // Navigator.pushNamed(context, LOGIN_ROUTE);
            // Navigator.pop(context);
            // Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const LoginScreen()),
    //     (route) => false);
  }
}
