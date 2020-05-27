import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  onButtonPressed(String buttonText) {
    if(buttonText == 'CLEAR') {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if(buttonText == "+" || buttonText == "-" || buttonText == "X" || buttonText == "/") {

      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if(buttonText == ".") {
      if(_output.contains("."))  {
        print('Already contains decimal');
      } else {
        _output = _output + buttonText;
      }
    } else if(buttonText == "=") {
      num2 = double.parse(output);

      if(operand == "+") {
        _output = (num1 + num2).toString();
      }
      if(operand == "-") {
        _output = (num1 - num2).toString();
      }
      if(operand == "/") {
        _output = (num1 / num2).toString();
      }
      
      if(operand == "X") {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
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
              color: Colors.white,
              child: Text(output, textAlign: TextAlign.end, style: TextStyle(fontSize: 40.0),),
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
                  button("/"),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("4"),
                  button("5"),
                  button("6"),
                  button("X"),
                ],

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("1"),
                  button("2"),
                  button("3"),
                  button("-"),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  button("."),
                  button("0"),
                  button("00"),
                  button("+"),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("CLEAR"),
                  button("="),
                  
                ],

              )
            ],
          ),
        ],
      ),
    );
  }



  Widget button(String buttonText) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onButtonPressed(buttonText);
        },
        child: Container(
          margin: EdgeInsets.all(4.0),
          height: 60.0,
          width: 60.0,
          child: Center(
            child: Text(buttonText, style: TextStyle(fontSize: 20.0, color: Colors.white),),
          ),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white10,
                offset: Offset(3.0, 3.0),
                blurRadius: 3.0,
                spreadRadius: 1.0
              ),
              BoxShadow(
                color: Colors.white12,
                offset: Offset(-3.0, -3.0),
                blurRadius: 3.0,
                spreadRadius: 1.0
              ),
            ],
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Colors.purple,
            //     Colors.purple,
            //     Colors.purple,
            //     Colors.purple
            //   ],
            //   stops: [0.1, 0.3, 0.8, 1]
            // )
          ),
        ),
      ),
    );
  }
}
