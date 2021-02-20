import 'package:calculator_app/widgets/calcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatefulWidget {
  MyCalculatorApp({Key key}) : super(key: key);
  @override
  MyCalculatorAppState createState() => MyCalculatorAppState();
}

class MyCalculatorAppState extends State<MyCalculatorApp> {
  String _history = '';
  String _result = '';

  void click(String text){
    setState(() {
      _result +=text;
    });
  }

  void allClean(String text){
    setState(() {
      _history='';
      _result ='';
    });
  }
  void clean(String text){
    setState(() {
      _result ='';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history=_result;
      _result =eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CalculatorApp",
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal:20 ),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 25,
                  ),
                  color: Colors.grey,
                ),
              ),
              alignment: Alignment(1,1),
            ),
            SizedBox(
              height:17,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _result,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 55,
                  ),
                  color: Colors.black87,
                ),
              ),
              alignment: Alignment(1,1),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  // backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFABABAB,callback: allClean,
                ),
                CalcButton(
                  text: 'C',
                  // backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFABABAB,callback: clean,
                ),
                CalcButton(
                  text: '%',
                  // backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFABABAB,callback: click,
                ),
                CalcButton(
                  text: '/',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFFF3E39,
                  textSize: 28,callback: click,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '8',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '9',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '*',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFFF3E39,
                  textSize: 28,callback: click,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '5',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '6',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '+',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFFF3E39,
                  textSize: 28,callback: click,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '2',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '3',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '-',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFFF3E39,
                  textSize: 28,callback: click,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '00',
                  // backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFABABAB,callback: click,
                ),
                CalcButton(
                  text: '0',
                  backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,callback: click,
                ),
                CalcButton(
                  text: '.',
                  // backGroundColor: 0xFFFFFFFF,
                  textColor: 0xFFABABAB,callback: click,
                ),
                CalcButton(
                  text: '=',
                  backGroundColor: 0xFFFF3E39,
                  textColor: 0xFFFFFFFF,
                  textSize: 28,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
