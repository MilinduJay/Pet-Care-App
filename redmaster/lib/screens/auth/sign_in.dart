import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:redmaster/screens/auth/titel.dart';

class SignIn extends StatelessWidget{
  const SignIn ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SignInForm(
     child: Padding(
       padding: const EdgeInsets.all(32.0),
       child: Column(children: <Widget>[
         Expanded(
           child: Align(alignment: Alignment.center,
           child: LoginTitle(
            title: 'Welcome\nBack',
           )),
         ),
         Expanded(
           child: ListView(
             children: [
               Padding(
                 padding: EdgeInsets.symmetric(vertical: 16),
                 child: EmailTextFormField(),
               )
             ],

           ),
         ),
       ],),
     ),
   );
  }

}