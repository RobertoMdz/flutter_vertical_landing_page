import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItemWidget extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomMenuItemWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomMenuItemWidgetState createState() => _CustomMenuItemWidgetState();
}

class _CustomMenuItemWidgetState extends State<CustomMenuItemWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: GestureDetector(
        onTap: () => widget.onPressed(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 150,
          height: 50,
          color: isHover ? Colors.pink : Colors.black,
          child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
