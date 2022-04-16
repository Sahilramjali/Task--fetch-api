import 'package:demoapp/common%20Widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:demoapp/common Widgets/widget.dart';

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment page'),
      ),
      body: Center(
        child: Container(
          child: TextWidget(
              text: "Appointment page", size: 25, color: Colors.black),
        ),
      ),
    );
  }
}
