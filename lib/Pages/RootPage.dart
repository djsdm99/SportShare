import 'package:flutter/material.dart';
import 'package:sportshareapp/Pages/HomePage.dart';
import 'package:sportshareapp/auth.dart';
import 'LoginPage.dart';

class RootPage extends StatefulWidget{
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}
enum AuthStatus{
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage>{
  AuthStatus authStatus = AuthStatus.notSignedIn;

  void initState(){
    super.initState();
    widget.auth.currentUser().then((userId){
      setState((){
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }
  
  void _signedIn(){
    setState(() {
          authStatus = AuthStatus.signedIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn:
            return new LoginPage(
              auth: widget.auth,
              );
      case AuthStatus.signedIn:
        return new HomePage(auth: widget.auth);
    }
      // TODO: implement build

    }
}