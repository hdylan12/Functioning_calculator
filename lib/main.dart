import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display area (placeholder)
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '0',
                style: TextStyle(fontSize: 48),
              ),
            ),
            SizedBox(height: 16),
            // Button rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundCalculatorButton('7'),
                RoundCalculatorButton('8'),
                RoundCalculatorButton('9'),
                RoundCalculatorButton('C', backgroundColor: Colors.red), // Clear button
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundCalculatorButton('4'),
                RoundCalculatorButton('5'),
                RoundCalculatorButton('6'),
                RoundCalculatorButton('*', backgroundColor: Colors.blue), // Multiply button
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundCalculatorButton('1'),
                RoundCalculatorButton('2'),
                RoundCalculatorButton('3'),
                RoundCalculatorButton('-', backgroundColor: Colors.blue), // Minus button
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundCalculatorButton('0'),
                RoundCalculatorButton('.', backgroundColor: Colors.blue), // Dot button
                RoundCalculatorButton('=', backgroundColor: Colors.blue), // Equals button
                RoundCalculatorButton('+', backgroundColor: Colors.blue), // Plus button
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundCalculatorButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;

  RoundCalculatorButton(this.text, {this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.grey[300],
        padding: EdgeInsets.all(20),
        minimumSize: Size(80, 80),
        shape: CircleBorder(),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
