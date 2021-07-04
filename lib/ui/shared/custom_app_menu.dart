import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_menu_item.dart';

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
    return GestureDetector(
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
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: 150,
          height: isOpen ? 400 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitleWidget(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItemWidget(
                  text: 'Home',
                  onPressed: () {},
                ),
                CustomMenuItemWidget(
                  text: 'About',
                  onPressed: () {},
                ),
                CustomMenuItemWidget(
                  text: 'Pricing',
                  onPressed: () {},
                ),
                CustomMenuItemWidget(
                  text: 'Contact',
                  onPressed: () {},
                ),
                CustomMenuItemWidget(
                  text: 'Location',
                  onPressed: () {},
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitleWidget extends StatelessWidget {
  const _MenuTitleWidget({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 30,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(
              milliseconds: 250,
            ),
            curve: Curves.easeInOut,
            width: isOpen ? 40 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            color: Colors.white,
            progress: controller,
          ),
        ],
      ),
    );
  }
}
