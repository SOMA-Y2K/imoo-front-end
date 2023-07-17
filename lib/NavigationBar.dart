import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigation extends StatefulWidget {
  Color backgroundColor = Color.fromARGB(255, 138, 175, 193);
  static int selectedIndex = 0;
  CustomBottomNavigation({
    super.key,
  });

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  void onItemTapped(int index) {
    setState(() {
      CustomBottomNavigation.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          label: "Feed",
          backgroundColor: widget.backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.trophy),
          label: "WorldCup",
          backgroundColor: widget.backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: "Upload",
          backgroundColor: widget.backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border_outlined),
          label: "BookMark",
          backgroundColor: widget.backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: "My Feed",
          backgroundColor: widget.backgroundColor,
        ),
      ],
      currentIndex: CustomBottomNavigation.selectedIndex,
      onTap: onItemTapped,
    );
  }
}
