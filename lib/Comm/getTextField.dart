import 'package:flutter/material.dart';

import 'comHelper.dart';

class getTextField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isobscureText;
  TextInputType inputType;
  bool _obscureText = true;


  getTextField(
      { required this.controller, required this.hintName, required this.icon, this.isobscureText = false, required this.inputType});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
          obscureText: isobscureText,
          controller: controller,
          keyboardType: inputType,
          validator: (val) {
            if (val?.length == 0) {
              return 'Please entre $hintName';
            }
            if (!ValidateEmail(val!) && hintName == "Mail") {
              return 'PLease entre valid Mail';
            }

            return null;
          },

          onSaved: (val) => controller.text = val!,

          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            prefixIcon: Icon(icon),
            hintText: hintName,
            labelText: hintName,
            fillColor: Colors.grey[200],
            filled: true,
          )
      ),
    );
  }

}
