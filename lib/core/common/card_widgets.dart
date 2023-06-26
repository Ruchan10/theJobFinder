import 'package:flutter/material.dart';

getCard(int width, int height) {
  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                SizedBox(width: width * .03),
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.apple_outlined),
                ),
                const Text(
                  "Apple",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * .07,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.bookmark_border),
                ),
              ],
            ),
          ),
        ],
      ),
      Container(
        alignment: Alignment.topLeft,
        height: height * .04,
        child: const Text(
          "   Software Engineer",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.location_on),
          ),
          const Text("""
1 Infinite Loop, 
Cupertino, California"""),
        ],
      ),
    ],
  );
}

void setState(Null Function() param0) {}
