import 'package:flutter/material.dart';
import 'package:give_my_certificate/presentation/theme/theme_colors.dart';

class EmailInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String> validateFunction;
  const EmailInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.textEditingController,
    this.onChanged,
    required this.validateFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextFormField(
        validator: validateFunction,
        controller: textEditingController,
        cursorColor: AppColor.brightGray,
        cursorWidth: 1.0,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Container(
              margin: EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    bottomLeft: Radius.circular(4.0)),
                color: AppColor.arsenic,
              ),
              child: Icon(icon)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.tuftsBlue, width: 0.6),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.brightGray, width: 0.02),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
