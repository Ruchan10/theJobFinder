import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeTabIndexProvider = StateProvider<int>((ref) => 0);

class TestView extends ConsumerWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
       final primaryColor = Colors.orange;
    final secondaryColor = Colors.black54;

    final activeTabIndex = ref.watch(activeTabIndexProvider);

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        // Your navigation bar content goes here
        children: [
          // Tab 1
          NavBarIcon(
            text: "Home",
            icon: Icons.home_outlined,
            selected: activeTabIndex.state == 0,
            onPressed: () => ref.read(activeTabIndexProvider).stateNotifier = 0,
            defaultColor: secondaryColor,
            selectedColor: primaryColor,
          ),
          // Tab 2
          NavBarIcon(
            text: "Search",
            icon: Icons.search_outlined,
            selected: activeTabIndex == 1,
            onPressed: () => ref.read(activeTabIndexProvider) = 1,
            defaultColor: secondaryColor,
            selectedColor: primaryColor,
          ),
          // Tab 3
          NavBarIcon(
            text: "Cart",
            icon: Icons.local_grocery_store_outlined,
            selected: activeTabIndex.state == 2,
            onPressed: () => ref.read(activeTabIndexProvider).state = 2,
            defaultColor: secondaryColor,
            selectedColor: primaryColor,
          ),
          // Tab 4
          NavBarIcon(
            text: "Calendar",
            icon: Icons.date_range_outlined,
            selected: activeTabIndex.state == 3,
            onPressed: () => ref.read(activeTabIndexProvider).state = 3,
            defaultColor: secondaryColor,
            selectedColor: primaryColor,
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: const Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
