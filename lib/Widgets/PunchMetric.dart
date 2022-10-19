
import 'package:flutter/material.dart';

class PunchMetricWidget extends StatefulWidget {
  PunchMetricWidget({Key? key, this.heading, required this.centerText, required this.bottomText, required this.onPressed, required this.isTapped}) : super(key: key);

  final String? heading;
  final String centerText;
  final String bottomText;
  final GestureTapCallback onPressed;
  final bool isTapped;

  @override
  State<PunchMetricWidget> createState() => _PunchMetricWidgetState();
}

class _PunchMetricWidgetState extends State<PunchMetricWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          color: widget.isTapped ? Colors.red : Colors.white,
          border: Border.all(
            width: 2.0,
            color: widget.isTapped ? Colors.red : Colors.black
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(5.0)
          ),
        ),
        margin: EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.heading ?? "",
              style: TextStyle(
                fontSize: 10,
                color: widget.isTapped ? Colors.white : Colors.black
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.centerText,
              style: TextStyle(
                fontSize: 10,
                color: widget.isTapped ? Colors.white : Colors.black
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.bottomText,
              style: TextStyle(
                fontSize: 10,
                color: widget.isTapped ? Colors.white : Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}