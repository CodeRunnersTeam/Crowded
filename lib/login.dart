import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'googleMap.dart';
import 'auth.dart';

/*
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Hello World!')), body: Body());
  }
}
*/

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Map()))
        });
  }

  Widget googleLoginButton() {
    return OutlineButton(
        onPressed: this.click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image(image: AssetImage('assets/google_logo.png'), height: 35),
                Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text('Sign in with Google',
                        style: TextStyle(color: Colors.grey, fontSize: 15)))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}
