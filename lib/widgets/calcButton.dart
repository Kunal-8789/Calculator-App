import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int backGroundColor;
  final int textColor;
  final double textSize;
  final Function callback;
  const CalcButton({Key key,
    this.text,
    this.backGroundColor,
    this.textColor= 0xFFFFFFFF,
    this.textSize=23,
    this.callback,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65,
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
              offset: Offset(0,20),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.07),
            ),
            ],
          ),


        child: TextButton(onPressed: () {
          callback(text);
        },
          style: TextButton.styleFrom(
          backgroundColor: backGroundColor !=null ? Color(backGroundColor): null,
          shape:CircleBorder(),
         ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
                color: Color(textColor),
              ),
            ),
          ),
       ),
        ),
      ),
    );
  }
}
