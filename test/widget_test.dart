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
            // Display area
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
                CalculatorButton('7'),
                CalculatorButton('8'),
                CalculatorButton('9'),
                CalculatorButton('C', color: Colors.red), // Delete button
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton('4'),
                CalculatorButton('5'),
                CalculatorButton('6'),
                CalculatorButton('*', color: Colors.blue), // Multiply button
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton('1'),
                CalculatorButton('2'),
                CalculatorButton('3'),
                CalculatorButton('-', color: Colors.blue), // Minus button
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton('0', color: Colors.grey[300]), // Color for '0' button
                CalculatorButton('.', color: Colors.blue), // Dot button
                CalculatorButton('=', color: Colors.blue), // Equals button
                CalculatorButton('+', color: Colors.blue), // Plus button
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;

  CalculatorButton(this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: color ?? Colors.grey[300],
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
