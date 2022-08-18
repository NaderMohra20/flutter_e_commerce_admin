import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/data/auth_provider.dart';

class splach extends StatefulWidget {
  @override
  State<splach> createState() => _splachState();
}

class _splachState extends State<splach> {
  navigatekey() async {
    await Future.delayed(Duration(seconds: 3));
    Provider.of<AuthProvider>(context, listen: false).checkUser();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    navigatekey();
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/png/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
