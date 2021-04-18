import 'package:chatwith/constants.dart';
import 'package:chatwith/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id='LogInScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AnimationController controller;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor:Color(0xFF0C143E),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(child:
            Hero(tag:'logo',child:Container(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value)
              {
                email=value;
              },
              decoration:kMessageTextFieldDecoration,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value)
              {
                pass=value;
              },
              decoration:kMessageTextFieldDecoration,
            ),
            SizedBox(
              height: 24.0,
            ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            elevation: 5.0,
            color:Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              onPressed:()async
              { setState(() {
                showSpinner=true;
              });
                try{
                UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: pass);
                Navigator.pushNamed(context,ChatScreen.id);
                setState(()
                {
                  showSpinner=false;
                });
              }
              catch (e) {
              print(e);
              }
              },
              minWidth: 200.0,
              height: 42.0,
              child: Text(
                'Log IN',
              ),
            ),
          ),
        ),
          ],
        ),
      ),
      ),
    );
  }
}


