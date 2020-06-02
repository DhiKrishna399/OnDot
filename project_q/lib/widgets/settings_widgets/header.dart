import 'package:flutter/material.dart';
import 'package:project_q/models/size_config.dart';

class SettingsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        const Spacer(),
        Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.blockSizeHorizontal * 9,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
