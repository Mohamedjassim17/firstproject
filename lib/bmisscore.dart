import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class bmiscore extends StatelessWidget {
  final double bmis;
  final int ages;
  String? bmistatus;
  String? bminterpertation;
  Color? bmistatuscolour;

  bmiscore({Key? key, required this.bmis, required this.ages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setbmiinterpation();
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Score"),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
      ),
      body: Card(
        shape: RoundedRectangleBorder(),
        elevation: 12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Score",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown[700],
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            PrettyGauge(
              maxValue: 40,
              minValue: 0,
              gaugeSize: 300,
              segments: [
                GaugeSegment(
                  "Under Weight",
                  18.5,
                  Colors.blue,
                ),
                GaugeSegment("Normal", 6.4, Colors.green),
                GaugeSegment("Over Weight", 5, Colors.orange),
                GaugeSegment("Obese", 10.1, Colors.red),
              ],
              valueWidget:
                  Text(bmis.toStringAsFixed(1), style: TextStyle(fontSize: 40)),
              currentValue: bmis.toDouble(),
              needleColor: Colors.brown[400]!,
            ),
            SizedBox(height: 10),
            Text(bmistatus!,
                style: TextStyle(
                    color: bmistatuscolour,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(bminterpertation!,
                style: TextStyle(
                    color: Colors.black, fontStyle: FontStyle.italic)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                    child: Text("Re-Caculate")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Share.share(
                        "Your bmi is score ${bmis.toStringAsFixed(1)} at age ${ages.toString()}  ");
                  },
                  child: Row(
                    children: [
                      Text("Share"),
                      SizedBox(width: 2),
                      Icon(Icons.share)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void setbmiinterpation() {
    if (bmis > 30) {
      bmistatus = "Obsese";
      bminterpertation = "Please work to reduce  obseity";
      bmistatuscolour = Colors.red;
    } else if (bmis >= 25) {
      bmistatus = "Over Weight";
      bminterpertation = "Do regular exericse & reduce the weight";
      bmistatuscolour = Colors.orange;
    } else if (bmis >= 18.5) {
      bmistatus = "Normal";
      bminterpertation = "You are fit & Enjoy your life";
      bmistatuscolour = Colors.green;
    } else if (bmis < 18.5) {
      bmistatus = "Under Weight";
      bminterpertation = "Try to increase to weight";
      bmistatuscolour = Colors.blue;
    }
  }
}
