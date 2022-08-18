// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/data/auth_provider.dart';
import 'package:todo_db_provider/log_in/sign_up_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/png/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: provider.loginKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 106,
                  ),
                  Text(
                    "Audio",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    "It's modular and designed to last",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 247,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: ((value) => provider.emailValiadation(value!)),
                      controller: provider.emailController,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.email_outlined),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      validator: (value) =>
                          provider.passwordValiadation(value!),
                      controller: provider.passwordController,
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.lock_outline),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.forgetPassword();
                    },
                    child: Text(
                      'Forgot Password',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ACF83),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        provider.signIn();
                      },
                      child: Text('Sign In'),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Didn\'t have any account? ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Sign Up here',
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => {AppRouter.NavigateToWidget(SignUpView())},
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff0ACF83),
                              decoration: TextDecoration.underline,
                            ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
