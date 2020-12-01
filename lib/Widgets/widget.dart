import 'package:flutter/material.dart';

Widget blueButton(
    {BuildContext context, String label, buttonWidth, buttonHeight}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(30)),
    alignment: Alignment.center,
    height: buttonHeight != null
        ? buttonHeight
        : MediaQuery.of(context).size.height - 620,
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 150,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}
