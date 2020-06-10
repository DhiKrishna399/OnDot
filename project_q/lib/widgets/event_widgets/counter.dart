import 'package:flutter/material.dart';
import 'package:project_q/models/size_config.dart';

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

int _currentCount = 0;

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: SizeConfig.screenHeight * 0.05,
          ),
          onPressed: add,
        ),
        Text(
          '$_currentCount',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.screenHeight * 0.03,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.chevron_right,
            size: SizeConfig.screenHeight * 0.05,
          ),
          onPressed: minus,
        ),
      ],
    );
  }

  void add() {
    setState(() {
      _currentCount++;
    });
  }

  void minus() {
    setState(() {
      _currentCount++;
    });
  }
}
