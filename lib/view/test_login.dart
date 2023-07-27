import 'package:flutter/material.dart';

class ProfileFb1 extends StatelessWidget {
  const ProfileFb1({required this.imageUrl, this.radius = 50.0, Key? key})
      : super(key: key);
  final String imageUrl;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
      ]),
    );
  }
}
