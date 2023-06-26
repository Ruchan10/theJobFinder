import 'package:flutter/material.dart';

Widget getSettingsBtn(String text, Icon icon) {
  return Row(
    children: [
      const SizedBox(width: 70),
      icon,
      Text(
        "    $text",
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    ],
  );
}
