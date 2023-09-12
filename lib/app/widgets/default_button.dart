import 'package:flutter/material.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class DefaultButton extends StatelessWidget {
  final bool? isLoading;
  final Function? onPressed;
  final Function? onLongPress;
  final String? text;
  const DefaultButton({
    super.key,
    this.isLoading = false,
    this.onPressed,
    this.onLongPress,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () => onPressed != null ? onPressed!() : null,
        onLongPress: () => onLongPress != null ? onLongPress!() : null,
        child: isLoading == true
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
              )
            : Text(
                text ?? 'Save',
                textScaleFactor: 1.0,
              ),
      ),
    );
  }
}
