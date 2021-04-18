import 'package:chatwith/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatwith/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id='RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  bool  showSpinner=false;
  @override
  Widget build(BuildContext context) {
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
            Hero(tag:'logo' , child:
            Container(
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
                color:Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed:()async {
                    setState(() {
                      showSpinner=true;
                    });
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
                        Navigator.pushNamed(context, ChatScreen.id);
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
                    'Register',
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
