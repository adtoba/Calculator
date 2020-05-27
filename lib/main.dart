import 'package:flutter/material.dart';

/* This calculator app was developed by adetoba as part of the 100 days coding challenge */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calc by Adtoba',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 70.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              child: Text(
                output,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 40.0),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10.0)
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("7"),
                  button("8"),
                  button("9"),
                  button("/", bgColor: Colors.purple, fontColor: Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("4"),
                  button("5"),
                  button("6"),
                  button("X", bgColor: Colors.purple, fontColor: Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("1"),
                  button("2"),
                  button("3"),
                  button("-", bgColor: Colors.purple, fontColor: Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  button("."),
                  button("0"),
                  button("00"),
                  button("+", bgColor: Colors.purple, fontColor: Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("C", fontColor: Colors.white, bgColor: Colors.green),
                  button("=", bgColor: Colors.purple, fontColor: Colors.white),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget button(String buttonText, {Color fontColor, Color bgColor}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onButtonPressed(buttonText);
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          height: 60.0,
          width: 60.0,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20.0, 
                color: fontColor == null ? Colors.black : fontColor,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: bgColor == null ? Color(0xFFfafafa) : bgColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 19.0,
                  spreadRadius: 0.0),
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0),
            ],
           
          ),
        ),
      ),
    );
  }
  void onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
      buttonText == "-" ||
      buttonText == "X" ||
      buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print('Already contains decimal');
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      if (operand == "X") {
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

}
