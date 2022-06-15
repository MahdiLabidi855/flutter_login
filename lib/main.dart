import 'package:flutter/material.dart';
import 'package:login/Screens/Login.dart';
import 'package:toast/toast.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

