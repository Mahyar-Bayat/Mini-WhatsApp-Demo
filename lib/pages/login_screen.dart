import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/components/Form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var page = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  Color(0xff2c5364),
                  Color(0xff0f2027)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Opacity(
              opacity: .1,
              child: Container(
                width: page.width,
                height: page.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/2.png"),
                        repeat: ImageRepeat.repeat
                    )
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                FormContainer(),
                FlatButton(
                    onPressed: null,
                    child: Text(
                      "آیا هیچ اکانتی ندارید؟ عضویت",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.5,
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: 230,
              height: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: const Text(
                "ورود",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: .3
                ),
              ),
            )
          ],
        ),
      ) ,
    );
  }

}