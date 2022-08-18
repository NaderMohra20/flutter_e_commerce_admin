import 'package:flutter/material.dart';
import 'package:todo_db_provider/AppRouter.dart';

class CustemDialog {
  static showdialog(String title) {
    return showDialog(
        context: AppRouter.navkey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: Text("No user found for that email."),
            actions: [
              TextButton(
                  onPressed: () {
                    AppRouter.popRoute();
                  },
                  child: Text("ÖK"))
            ],
          );
        });
  }
}
