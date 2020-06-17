import 'package:flutter/material.dart';
import 'package:project_q/models/size_config.dart';

class Counter extends StatefulWidget {
  int count;

  Counter({Key key, @required this.count}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

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
          onPressed: (){
            setState(() {
              if(widget.count >= 1) widget.count--;
              
            });
          },
        ),
        Text(
          '${widget.count}',
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
          onPressed: () {
            setState(() {
              if(widget.count >= 0) widget.count++;
              
            });
          },
        ),
      ],
    );
  }


}

