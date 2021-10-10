import 'package:flutter/material.dart';
import 'package:give_my_certificate/presentation/theme/theme_colors.dart';

class Button extends StatelessWidget {
  final String? text;
  final Function() onPressed;
  const Button({@required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        color: AppColor.tuftsBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Text(
          text.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
