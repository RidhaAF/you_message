import 'package:flutter/material.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class DefaultSpacer extends StatelessWidget {
  final double? width;
  final double? height;
  const DefaultSpacer({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? defaultMargin,
      height: height ?? defaultMargin,
    );
  }
}
