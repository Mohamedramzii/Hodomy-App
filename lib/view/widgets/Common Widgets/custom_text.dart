import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Text extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final Alignment textalign;
  final FontWeight fontWeight;
  final int maxlines;
  final double height;
  final TextDecoration underline;
  
  const Custom_Text(
      {Key? key,
      required this.text,
      required this.fontsize,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.maxlines = 1,
      this.height = 1,
      
      required this.textalign, required this.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: textalign,
      child: Text(
        text,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: maxlines,
        style: GoogleFonts.adamina(
          textStyle: TextStyle(
            decoration: underline,
            height: height,
            fontSize: fontsize,
            color: color,
            fontWeight: fontWeight),
        )
      ),
    );
  }
}
