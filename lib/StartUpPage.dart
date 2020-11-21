import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp/HomePage.dart';
import 'package:groceryapp/MyCartPage.dart';
import 'package:groceryapp/OrderHistoryPage.dart';
import 'package:groceryapp/ProfilePage.dart';
import 'package:groceryapp/Tools/Authentication.dart';

class StartUpPage extends StatefulWidget {
  StartUpPage({this.auth, this.onSignedOut});

  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  @override
  _StartUpPageState createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    MyCartPage(),
    OrderHistoryPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _children[_currentIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          onTap: onTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: new Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: new Text("My Cart")),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: new Text("My Orders")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: new Text("Profile")),
          ],
        ),
      ),
    );
  }

  onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuilderContext) {
          return AlertDialog(
            title: Text("Confirm Exit"),
            content: Text("Are You sure want to exit"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    return Future.value(true);
  }
}
