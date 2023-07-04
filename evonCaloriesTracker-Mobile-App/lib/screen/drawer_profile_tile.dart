import 'package:evon_calories_tracker/utils/constants.dart';
import 'package:evon_calories_tracker/widgets/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// FlutterSecureStorage storage = const FlutterSecureStorage();
// String? value = await storage.read(key: 'token');

class DrawerProfileTile extends StatelessWidget {
  const DrawerProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(_user.balance);
    return GestureDetector(
      onTap: () => () {},
      child: Container(
        margin: const EdgeInsets.only(
          top: 50.0,
        ),
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, USER_PROFILE_UPDATE_ROUTE),
                    child: NetworkImageWithPlaceHolder(
                      // imageUrl: _user.profileImageUrl,
                      imageUrl: 'assets/svgs/person_outer_circle.svg',
                      fit: BoxFit.fill,
                      height: 72.0,
                      width: 72.0,
                      radius: 50.0,
                      placeHolderWidget: SvgPicture.asset(
                        'assets/svgs/person_outer_circle.svg',
                        height: 72.0,
                        width: 72.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    // _user.firstName,
                    'User1 Test1',
                    style: headline6.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8.0),
            // Text(
            //   // 'Wallet Balance: ' + _user.balance.toString(),
            //   'Wallet Balance: 0',
            //   style: subHeadline5.copyWith(color: Colors.black),
            // ),
            // const SizedBox(width: 8.0),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
