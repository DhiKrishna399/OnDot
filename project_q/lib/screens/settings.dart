import 'package:flutter/material.dart';
import 'package:project_q/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:project_q/models/size_config.dart';
import 'package:project_q/widgets/settings_widgets/header.dart';

import '../providers/auth.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settingPage';
  SettingsPage({Key key}) : super(key: key);
  

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final AuthService _auth = AuthService();
    
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double inkwellFontSize = SizeConfig.screenWidth * 0.07;
    double infoFontSize = SizeConfig.screenWidth * 0.04;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SettingsHeader(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Container(
                height: SizeConfig.screenHeight * 0.80,
                //padding: EdgeInsets.only(left: 30, right: 25),
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .1),                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            //Row tht holds 'Account' and edit button
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Account',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: SizeConfig.screenWidth * 0.06,
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
                            height: SizeConfig.screenHeight * 0.03,
                          ),
                          Text(
                            'Name: Buzz',
                            style: TextStyle(fontSize: infoFontSize),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.02,
                          ),
                          Text(
                            'Email: ImGame@ImGame.com',
                            style: TextStyle(fontSize: infoFontSize),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.05,
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.05,
                          ),
                          InkWell(
                            child: new Text('Notifications',
                                style: TextStyle(fontSize: inkwellFontSize)),
                            onTap: () {},
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.05,
                          ),
                          InkWell(
                            child: new Text('Map',
                                style: TextStyle(fontSize: inkwellFontSize)),
                            onTap: () {},
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.05,
                          ),
                          InkWell(
                            child: new Text('Activities',
                                style: TextStyle(fontSize: inkwellFontSize)),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: InkWell(
                          child: new Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: inkwellFontSize * 0.90,
                              color: Colors.red[400],
                            ),
                          ),
                          onTap: () async{
                            await _auth.signOut();
                           //Navigator.of(context).pushReplacementNamed(MainUserScreen.routeName);
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          //  Provider.of<Auth>(context, listen: false).logout();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
