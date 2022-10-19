import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  CustomToggleButton({Key? key, required this.text, required this.isTapped, this.onPressed}) : super(key: key);

  final String text;
  final bool isTapped;
   final GestureTapCallback? onPressed;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 20,
          color: widget.isTapped ? Colors.white : Colors.black
        ),
      ),
      onPressed: widget.onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        side : MaterialStateProperty.all(BorderSide(color: Colors.red, width: 3)),
        padding:MaterialStateProperty.all(EdgeInsets.only(left: 25, right: 25, top: 10,bottom: 10)) ,
        backgroundColor: MaterialStateProperty.all(
          widget.isTapped ? Colors.red : Colors.transparent
        )
      )
    );
  }
}