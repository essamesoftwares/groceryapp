import 'package:flutter/material.dart';
import 'package:groceryapp/StartUpPage.dart';
import 'package:groceryapp/Tools/Authentication.dart';
import 'package:groceryapp/loginRegisterPage.dart';

class Mapping extends StatefulWidget {
  final AuthImplementation auth;
  Mapping({this.auth});
  State<StatefulWidget> createState() {
    return _MappingState();
  }
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _MappingState extends State<Mapping> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((fireBaseUserId) {
      setState(() {
        authStatus = fireBaseUserId == null
            ? AuthStatus.notSignedIn
            : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginRegisterPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );

      case AuthStatus.signedIn:
        return new StartUpPage(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
    return Container();
  }
}
