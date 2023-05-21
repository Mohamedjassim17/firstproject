import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class gendercheck extends StatefulWidget {
  final Function(int) onchanged;
  const gendercheck({Key? key, required this.onchanged}) : super(key: key);

  @override
  State<gendercheck> createState() => _gendercheckState();
}

class _gendercheckState extends State<gendercheck> {
  final ChoiceChip3DStyle unselectbutton =
      ChoiceChip3DStyle(topColor: Colors.grey[400]!, backColor: Colors.white);

  final ChoiceChip3DStyle selectbutton =
      ChoiceChip3DStyle(topColor: Colors.white, backColor: Colors.grey[400]!);
  int gender = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ChoiceChip3D(
              border: Border.all(color: Colors.black),
              style: gender == 1 ? unselectbutton : selectbutton,
              onSelected: () {
                setState(() {
                  gender = 1;
                });
                widget.onchanged(gender);
              },
              onUnSelected: () {},
              selected: (gender == 1),
              child: Column(
                children: [
                  Image.asset("web/maleicon-removebg-preview.png", width: 90),
                  SizedBox(height: 5),
                  Text("Male"),
                ],
              )),
        ),
        SizedBox(width: 15),
        Padding(
          padding: EdgeInsets.all(10),
          child: ChoiceChip3D(
            onSelected: () {
              setState(() {
                gender = 2;
              });
            },
            onUnSelected: () {},
            selected: gender == 2,
            border: Border.all(color: Colors.black),
            style: gender == 2 ? unselectbutton : selectbutton,
            child: Column(
              children: [
                Image.asset("web/women-removebg-preview (1).png"),
                SizedBox(height: 5),
                Text("Women")
              ],
            ),
          ),
        )
      ],
    );
  }
}
