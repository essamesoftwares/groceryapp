import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:groceryapp/Tools/Authentication.dart';
import 'package:groceryapp/Tools/Mapping.dart';
import 'package:groceryapp/loginRegisterPage.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Carousel(
        showIndicator: false,
        animationDuration: Duration(milliseconds: 600),
        images: [
          Image.asset(
            'images/slider1.png',
            height: 100,
            width: 100,
          ),
          Image.asset(
            'images/slider2.png',
            height: 100,
            width: 100,
          ),
          Image.asset(
            'images/slider3.png',
            height: 100,
            width: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return Center(
                  child: Opacity(
                    opacity: 1.0,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.orangeAccent),
                    ),
                  ),
                );
              });
          Timer(
              Duration(seconds: 5),
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Mapping(
                            auth: Auth(),
                          ))));
        },
        label: Text('Start'),
        icon: Icon(Icons.arrow_right),
        backgroundColor: Colors.orangeAccent,
        elevation: 10,
      ),
    );
  }
}
