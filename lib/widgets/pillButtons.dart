import 'package:flutter/material.dart';

const String apiBaseUrl = 'http://192.168.1.6:3000/';

Widget getPillBtn(String text, {Color color = Colors.white}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green),
      shape: BoxShape.rectangle,
      color: color,
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                " $text",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget getUserPill(
    {required String profile,
    required String name,
    required String email,
    required String number,
    required String cv}) {
  return Column(
    children: [
      SizedBox(
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: profile.isNotEmpty
                  ? NetworkImage(apiBaseUrl + profile)
                  : const AssetImage('assets/images/profile.jpg')
                      as ImageProvider,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      Text(
        email,
        style: const TextStyle(fontSize: 25),
      ),
      Text(
        number,
        style: const TextStyle(fontSize: 25),
      ),
    ],
  );
}
