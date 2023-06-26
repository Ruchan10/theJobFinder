import 'package:flutter/material.dart';

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
