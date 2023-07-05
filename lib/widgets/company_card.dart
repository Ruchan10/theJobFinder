import 'package:flutter/material.dart';

Widget getCompanyCard(BuildContext context, double width, double height,
    String name, String job, String location, String time) {
  return Container(
    width: width * .8,
    height: height * .24,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black12),
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(width: width * .03),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.apple_outlined),
                    ),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .07,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark),
                    ),
                    SizedBox(width: width * .03),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "   $job",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
              ),
              Text(location),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.timer),
              ),
              Text(time),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget getCompanyCardSmall(BuildContext context, double width, double height,
    String name, String job, String location) {
  return Container(
    width: width * .61,
    height: height * .18,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black12),
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(width: width * .03),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.apple_outlined),
                      ),
                      Text(
                        name,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .07,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark),
                      ),
                      SizedBox(width: width * .03),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "   $job",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                ),
                Text(location),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
