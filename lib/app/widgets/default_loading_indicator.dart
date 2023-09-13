import 'package:flutter/material.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class DefaultLoadingIndicator extends StatelessWidget {
  const DefaultLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
      ),
    );
  }
}
