import 'package:flutter/material.dart';

Widget getPillBtnIcon(String text, Icon icon, {Color color = Colors.white}) {
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
            Padding(padding: const EdgeInsets.only(left: 5), child: icon),
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
