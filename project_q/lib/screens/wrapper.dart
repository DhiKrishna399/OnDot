import 'package:flutter/material.dart';
import 'package:project_q/authentication/authenticate.dart';
import 'package:project_q/models/user.dart';
import 'package:project_q/screens/home_screen.dart';
import 'package:project_q/screens/main_user_info.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
