
import 'package:flutter/material.dart';
import 'package:login/Comm/getTextField.dart';
import 'package:login/DBHandler/DBhelper.dart';
import 'package:login/Model/UserModel.dart';
import 'package:login/Screens/Login.dart';
import 'package:toast/toast.dart';

import '../Comm/comHelper.dart';
import '../Comm/getHeader.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = new GlobalKey<FormState>();
  final _conUserID = TextEditingController();
  final _conUserName = TextEditingController();
  final _conUserPhone = TextEditingController();
  final _conUserMail = TextEditingController();
  final _conUserPassword = TextEditingController();
  final _conUserConfirmePassword = TextEditingController();

  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper = DBhelper();

  }

  alert() async{
    final form = _formKey.currentState;

    String ID = _conUserID.text;
    String Name = _conUserName.text;
    String phone = _conUserPhone.text;
    String email = _conUserMail.text;
    String pwd = _conUserPassword.text;
    String cpwd = _conUserConfirmePassword.text;
    if(form!.validate()){
      if(cpwd != pwd){
        alertDialog(context, "Please repeater the same Password");
      }else{
        form.save();
        UserMode uModel = UserMode(ID, email, Name, pwd, phone);
        await dbHelper.saveData(uModel).then((UserData){
          alertDialog(context,"Successfully Saved");
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_)=> Login()),
                  (Route<dynamic> route) => false);
        }).catchError((error){
          print(error);
          alertDialog(context, "Error: Data Save Fail");/*
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_)=> Login()),
                  (Route<dynamic> route) => false);*/
        });
      }
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getHeader(getitel: 'Signup',
                  getmesg:'Already Sign Up ?' ,
                  getNavText:'Sign In' ,
                  go: Login(),
                ),
                getTextField(
                  controller: _conUserID,
                  hintName: 'User ID',
                  icon: Icons.perm_identity,
                  inputType: TextInputType.text,
                ),
                getTextField(
                  controller: _conUserName,
                  hintName: 'User Name',
                  icon: Icons.person_outline,
                  inputType: TextInputType.text,
                ),
                getTextField(
                  controller: _conUserPhone,
                  hintName: 'Phone Number',
                  icon: Icons.phone_android,
                  inputType: TextInputType.text,
                ),
                getTextField(
                  controller: _conUserMail,
                  hintName: 'Mail',
                  icon: Icons.mail_outline_sharp,
                  inputType: TextInputType.text,
                ),
                getTextField(
                    controller: _conUserPassword,
                    hintName: 'Password ',
                    icon: Icons.lock_outline,
                    inputType: TextInputType.visiblePassword,
                    isobscureText: true
                ),
                getTextField(
                    controller: _conUserConfirmePassword,
                    hintName: 'Confirm Password ',
                    icon: Icons.lock_outline,
                    inputType: TextInputType.visiblePassword,
                    isobscureText: true
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed:  (){
                      alert();
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
