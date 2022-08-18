import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/data/auth_provider.dart';
import 'package:todo_db_provider/firebase_options.dart';
import 'package:todo_db_provider/screens/category_screen/add_categorise_screen.dart';
import 'package:todo_db_provider/log_in/sign_in_view.dart';
import 'package:todo_db_provider/log_in/sign_up_view.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/category_screen/categories_screen.dart';
import 'package:todo_db_provider/screens/home_screen.dart';
import 'package:todo_db_provider/splation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) {
      return AuthProvider();
    }),
    ChangeNotifierProvider<FirestoreProvider>(create: (context) {
      return FirestoreProvider();
    }),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.navkey,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: splach(),
    );
  }
}
