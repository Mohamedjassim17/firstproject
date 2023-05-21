import 'package:bmi/gendercheck.dart';
import 'package:flutter/material.dart';

import 'height.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int gender = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        leading: Icon(Icons.person),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(),
          child: Column(
            children: [
              gendercheck(onchanged: (genderval) {
                gender = genderval;
              }),
              height(),
            ],
          ),
        ),
      ),
    );
  }
}
