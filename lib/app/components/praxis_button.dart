import 'package:flutter/material.dart';

class PraxisButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const PraxisButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(text),
      textColor: Colors.white,
      color: Theme.of(context).buttonColor,
      onPressed: onPressed,
    );
  }
}
