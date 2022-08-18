import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/screens/category_screen/add_categorise_screen.dart';
import 'package:todo_db_provider/log_in/show_Dialog.dart';
import 'package:todo_db_provider/log_in/sign_in_view.dart';
import 'package:todo_db_provider/screens/category_screen/categories_screen.dart';
import 'package:todo_db_provider/screens/home_screen.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
            context: AppRouter.navkey.currentContext!,
            builder: (context) {
              return AlertDialog(
                content: const Text("No user found for that email."),
                actions: [
                  TextButton(
                      onPressed: () {
                        AppRouter.popRoute();
                      },
                      child: Text("ÖK"))
                ],
              );
            });
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signUot() async {
    await firebaseAuth.signOut();
    AppRouter.NavigateToWidget(SignInView());
  }

  checkUser() async {
    User? user = await firebaseAuth.currentUser;
    if (user == null || !user.emailVerified) {
      AppRouter.NavigateToWidgetReplacement(HomeScreen());
    } else {
      AppRouter.NavigateToWidgetReplacement(SignInView());
    }
  }

  forgetpassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      CustemDialog.showdialog(
          "الرجاء متابعة الايميل الخاص بك لتغير كلمة المرور");
    } on Exception catch (e) {
      // TODO
    }
  }
}
