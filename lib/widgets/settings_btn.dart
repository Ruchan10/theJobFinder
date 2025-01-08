import 'package:flutter/material.dart';
Widget getSettingsBtn({required String text, required Icon icon, Color color=Colors.black}) {
  return Row(
    children: [
      const SizedBox(width: 70),
      icon,
      Text(
        "    $text",
        style: TextStyle(
          fontSize: 20,
          color: color,
        ),
      ),
    ],
  );
}
