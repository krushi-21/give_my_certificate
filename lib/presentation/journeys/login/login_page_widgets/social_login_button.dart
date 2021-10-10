import 'package:flutter/material.dart';
import 'package:give_my_certificate/common/constants/size_constants.dart';

import 'package:give_my_certificate/presentation/theme/theme_colors.dart';
import '/common/extensions/size_extensions.dart';

class SocialLoginButton extends StatelessWidget {
  final String? imgPath;
  final String? socialName;
  final Function() onPressed;
  const SocialLoginButton(
      {Key? key,
      @required this.imgPath,
      @required this.socialName,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
              width: 0.5, color: AppColor.brightGray.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 16, width: 16, child: Image.asset(imgPath.toString())),
            SizedBox(width: Sizes.dimen_10.w),
            Text(socialName.toString()),
          ],
        ),
      ),
    );
  }
}
