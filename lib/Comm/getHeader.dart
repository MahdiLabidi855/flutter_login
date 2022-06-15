import 'package:flutter/material.dart';

import '../Screens/Signup.dart';

class getHeader extends StatelessWidget {
  String getitel;
  String getmesg;
  String getNavText;
  Widget go;




  getHeader({required this.getitel, required this.getmesg, required this.getNavText, required this.go});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(getitel,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30)),
          SizedBox(width: 45),
          Image.asset(
            "assets/images/logo.jpg",
            height: 100,
            width: 150,
          )
        ],
      ),
    ),
    SizedBox(height: 20),
    Container(
    margin: EdgeInsets.only(left: 30, right: 30),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(getmesg),
    FlatButton(
    textColor: Colors.orange,
    child: Text(getNavText),
    onPressed: () {
    Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (_) => go),
    (Route<dynamic> route) => false);
    },
    )
    ],
    ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black38,
            width: 1.0,
          ),
        ),
      ),

      ),
    ],
    ),
    );
  }
}
