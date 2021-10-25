import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.name, this.color});

  final name;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        '$name',
        style: TextStyle(color: Colors.white),
      )),
      width: double.infinity,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
