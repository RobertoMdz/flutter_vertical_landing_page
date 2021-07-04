import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingView extends StatelessWidget {
  const PricingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Text(
          'Pricing',
          style: GoogleFonts.montserratAlternates(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}