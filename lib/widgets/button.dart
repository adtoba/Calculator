import 'package:flutter/material.dart';



class CalcButton extends StatelessWidget {
  CalcButton({
    @required this.buttonText,
    @required this.onButtonPressed
  });

  final String buttonText;
  final Function onButtonPressed;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonPressed,
      child: Container(
        height: 150,
        width: 150,
        child: Center(
          child: Text(buttonText, style: TextStyle(fontSize: 20.0, color: Colors.white),),
        ),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.purple[900],
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0
            ),
            BoxShadow(
              color: Colors.purple[900],
              offset: Offset(-4.0, -4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple[200],
              Colors.purple[300],
              Colors.purple[400],
              Colors.purple[500]
            ],
            stops: [0.1, 0.3, 0.8, 0.9]
          )
        ),
      ),
    );
  }
}