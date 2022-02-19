import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/components/InputFields.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Form(
            child: Column(
              children: <Widget>[
                InputFieldArea(
                  hint: "ایمیل کاربری",
                  obscure: false,
                  icon : Icons.person_outline
                ),
                InputFieldArea(
                  hint: "پسورد",
                  obscure: true,
                  icon: Icons.lock_open
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}