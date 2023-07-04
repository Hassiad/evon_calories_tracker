import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({
  //   Key? key,
  // }) : super(key: key);

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final DecorationImage? image;
  final double? height;
  final double? width;
  // final void Function()? onPress;

  const ReusableCard(
      {Key? key,
      required this.colour,
      this.cardChild,
      this.onPress,
      this.margin,
      this.borderRadius,
      this.image,
      this.height,
      this.width,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: margin,
        padding: padding,
        height: height,
        // height: 150.0,
        width: width,
        decoration: BoxDecoration(
            color: colour,
            // borderRadius: BorderRadius.circular(10.0),
            borderRadius: borderRadius,
            image: image),
      ),
    );
  }
}

// Function gesture =  GestureDetector(
// onTap: () {
// // print('Male tap');
// setState(() {
// selectedGender = Gender.male;
// });
// })
