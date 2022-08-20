import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator",
      theme: new ThemeData(),
      home: Calculator(),
    );
  }
}

final List<String> buttons = [
  '±',
  '√',
  '←',
  'C',
  '7',
  '8',
  '9',
  '+',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  'x',
  '0',
  '.',
  '↲',
  '/',
];
