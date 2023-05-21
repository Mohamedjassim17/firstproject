import 'package:flutter/material.dart';

class ageweight extends StatefulWidget {
  final Function(int) onchange;
  final String title;
  final int intivalue;
  final int min;
  final int max;
  final age;

  const ageweight(
      {Key? key,
      required this.onchange,
      this.age,
      required this.title,
      required this.intivalue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  State<ageweight> createState() => _ageweightState();
}

class _ageweightState extends State<ageweight> {
  int counter = 0;
  int height = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.intivalue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(widget.title,
                style: TextStyle(fontSize: 20, color: Colors.grey)),
            Row(
              children: [
                InkWell(
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.brown[300],
                    child: Icon(
                      Icons.remove_circle,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (counter > widget.min) {
                        counter--;
                      }
                      widget.onchange(counter);
                    });
                  },
                ),
                SizedBox(width: 10),
                Text(counter.toString()),
                SizedBox(width: 10),
                InkWell(
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.brown[300],
                    child: Icon(Icons.add_circle, color: Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      if (counter < widget.max) {
                        counter++;
                      }
                      widget.onchange(counter);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
