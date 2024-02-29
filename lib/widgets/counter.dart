import 'package:flutter/material.dart';

class counter extends StatelessWidget {
  final int completed;
  final int length;
  const counter({super.key, required this.completed, required this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 27),
      child: Text(
        "$completed/$length",
        style: TextStyle(
            fontSize: 44, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
