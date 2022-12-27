import 'dart:async';

import 'package:fla/SplashScreen.dart';
import 'package:fla/api/api.dart';
import 'package:fla/auth/login.dart';
import 'package:fla/auth/register.dart';
import 'package:fla/user/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const cartela());

class cartela extends StatelessWidget {
// set value
  const cartela({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ,
      home: Scaffold(
        body:  MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // api.ppr();
    Timer(
        Duration(seconds: 3),
        () => {
              if (api.ppr('user') == 'user')
                {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>const home()))
                }
              else
                {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const register()))
                }
            });
    return SplashScreen();
  }
}
