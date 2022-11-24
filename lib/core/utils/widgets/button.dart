import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final Color? color;
  final Color? splashColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? highlightColor;
  final Color? textColor;
  final String? text;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  const ButtonApp({
    Key? key,
    this.color = Colors.blue,
    this.text = '',
    this.textStyle,
    this.height = 40.0,
    this.splashColor = Colors.transparent,
    this.highlightColor = Colors.transparent,
    this.hoverColor = Colors.transparent,
    this.focusColor = Colors.transparent,
    this.padding,
    required this.onPressed,
    this.elevation = 0.0,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.borderRadius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        textColor: textColor,
        splashColor: splashColor,
        highlightColor: highlightColor,
        hoverColor: hoverColor,
        focusColor: focusColor,
        padding: padding,
        color: color,
        child: Text(
          '$text',
          style: textStyle,
        ),
        elevation: elevation,
        onPressed: onPressed,
      ),
    );
  }
}
