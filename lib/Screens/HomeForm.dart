import 'package:flutter/material.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({Key? key}) : super(key: key);

  @override
  State<HomeForm> createState() => _State();
}

class _State extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      ),
      body:Center(
        child: Text('Login successful'),
    )
    );
  }
}
