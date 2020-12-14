import 'package:flutter/material.dart';

class WideRedButton extends StatelessWidget {
  final String label;
  final Color color;
  final Function onPressed;
  WideRedButton({
    @required this.label,
    @required this.onPressed,
    this.color
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      height: 45,
      minWidth: double.infinity,
      color: color ?? Colors.redAccent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Robot-M',
              color: color == null ? Colors.white : Colors.redAccent
          ),
        ),
      ),
    );
  }
}
