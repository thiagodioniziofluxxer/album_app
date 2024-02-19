// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:album_app/app/core/ui/styles/button_style.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool? outline;
  const Button({
    Key? key,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    this.outline = false,
  }) : super(key: key);

  Button.primary({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
  })  : style = ButtonStyles.instance.primaryButton,
        labelStyle = TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
          color: Colors.white
        ),
        outline = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );

    return SizedBox(
        width: width,
        height: height,
        child: outline!
            ? OutlinedButton(
                onPressed: onPressed,
                style: style,
                child: labelText,
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: style,
                child: labelText,
              ));
  }
}
