import 'package:flutter/material.dart';
import 'package:login/Comm/comHelper.dart';
import 'package:login/DBHandler/DBhelper.dart';
import 'package:login/Screens/Signup.dart';

import '../Comm/getHeader.dart';
import '../Comm/getTextField.dart';
import 'HomeForm.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  final _conUserId = TextEditingController();
  final _conUserPassword = TextEditingController();
  var dbHelper;
  @override
  void initState(){
    super.initState();
    dbHelper = DBhelper();

  }
  login() async{
    final form = _formKey.currentState;


    String id = _conUserId.text;
    String pwd = _conUserPassword.text;
    if(id.isEmpty){
      alertDialog(context, "please entre id");
    }else if(pwd.isEmpty){
      alertDialog(context, "please entre Password");
    }else{
    await dbHelper.getLoginUser(id,pwd).then((UserData){
      print(UserData.email);
      alertDialog(context, " Login Successfully");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_)=> HomeForm()),
              (Route<dynamic> route) => false);

    }).catchError((error){
      print(error);
      alertDialog(context, "Error: Login Failed $id not found");
    });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getHeader(getitel: 'Login',
                getmesg:'Does not Sign up ?' ,
                getNavText:'Sign up' ,
                go: Signup(),
              ),

                SizedBox(
                  height: 20,
                ),
                getTextField(
                  controller: _conUserId,
                  hintName: 'Your Id',
                  icon: Icons.person_outline,
                  inputType: TextInputType.text,
                ),
                getTextField(
                  controller: _conUserPassword,
                  hintName: 'Password',
                  icon: Icons.lock_outline,
                  isobscureText: true,
                  inputType: TextInputType.visiblePassword,
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      login();
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
