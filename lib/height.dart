import 'dart:math';

import 'package:bmi/ageweight.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'bmisscore.dart';

class height extends StatefulWidget {
  height({Key? key}) : super(key: key);

  @override
  State<height> createState() => _heightState();
}

class _heightState extends State<height> {
  int heights = 150;
  int age = 100;
  int gender = 0;
  int weight = 40;
  double bmis = 0;
  bool finished = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          elevation: 10,
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Height",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(heights.toString(),
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text("Cm",
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
              Slider(
                value: heights.toDouble(),
                onChanged: (values) {
                  setState(() {
                    heights = values.toInt();
                  });
                },
                thumbColor: Colors.orange,
                inactiveColor: Colors.grey,
                activeColor: Colors.brown[400],
                min: 0,
                max: 240,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ageweight(
                      onchange: (agesval) {
                        age = agesval;
                      },
                      title: "age",
                      intivalue: 18,
                      min: 0,
                      max: 100,
                    ),
                    ageweight(
                        onchange: (weightval) {
                          setState(() {
                            weight = weightval;
                          });
                        },
                        title: "Weight(Kg)",
                        intivalue: 80,
                        min: 0,
                        max: 200)
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SwipeableButtonView(
                    isFinished: finished,
                    onFinish: () async {
                      await Navigator.push(
                          context,
                          PageTransition(
                              child: bmiscore(
                                bmis: bmis,
                                ages: age,
                              ),
                              type: PageTransitionType.leftToRight));

                      setState(() {
                        finished = false;
                        Share.share("");
                      });
                    },
                    onWaitingProcess: () {
                      bmicaculate();
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          finished = true;
                        });
                      });
                    },
                    activeColor: Colors.brown[400]!,
                    buttonWidget: Icon(Icons.arrow_right_alt_rounded),
                    buttonText: "Calculate the Bmi"),
              )
            ],
          )),
    );
  }

  void bmicaculate() {
    print("the is weight $weight");
    print("this is height $heights");
    print("this is age $age");

    bmis = weight / pow(heights / 100, 2);
  }
}
