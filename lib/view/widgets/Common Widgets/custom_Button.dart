import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Button extends StatelessWidget {
  final Function() onPress;
  final double width;
  final double height;
  final String text;
  final double fontsize;
  final Color color;

  const Custom_Button(
      {Key? key,
      required this.onPress,
      required this.width,
      required this.height,
      required this.text,
      this.color = Colors.black,
      required this.fontsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: color,
      textColor: Colors.white,
      // padding: EdgeInsets.all(20),
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: GoogleFonts.aclonica(
          textStyle:TextStyle(fontSize: fontsize)
        ),
      ),
    );
  }
}
