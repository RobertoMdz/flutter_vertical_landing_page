import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: 150,
      height: 50,
      color: Colors.black,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(
              milliseconds: 250,
            ),
            curve: Curves.easeInOut,
            width: isOpen ? 30 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (isOpen) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
                setState(() {
                  isOpen = !isOpen;
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Colors.white,
                progress: controller,
              ),
            ),
          )
        ],
      ),
    );
  }
}
