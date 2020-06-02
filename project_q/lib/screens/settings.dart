import 'package:flutter/material.dart';
import 'package:project_q/models/size_config.dart';
import 'package:project_q/widgets/settings_widgets/header.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SettingsHeader(),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 6,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 25),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //Row tht holds 'Account' and edit button
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Account',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            color: Colors.black),
                      ),
                      Container(
                        //color: Colors.black,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black,
                        ),

                        child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: null),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Name: Buzz',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 1.5,
                      ),
                      Text(
                        'Email: ImGame@ImGame.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      InkWell(
                        child: new Text('Notifications',
                            style: TextStyle(fontSize: 24)),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      InkWell(
                        child: new Text('Map', style: TextStyle(fontSize: 24)),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      InkWell(
                        child: new Text('Activities',
                            style: TextStyle(fontSize: 24)),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: new Text('Sign Out', style: TextStyle(fontSize: 20)),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
