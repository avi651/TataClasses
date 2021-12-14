import 'package:flutter/material.dart';

class CentralizeTextField extends StatelessWidget {
  CentralizeTextField(
      {@required this.alignment,
      this.margin,
      @required this.text,
      @required this.textStyle,
      this.width,
      this.height,
      this.textAlign,
      this.padding});

  final Alignment alignment;
  final EdgeInsets margin, padding;
  final String text;
  final TextStyle textStyle;
  final double width, height;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment ?? Alignment.centerLeft,
        child: Container(
          width: width ?? null,
          height: height ?? null,
          margin: margin ?? EdgeInsets.zero,
          padding: padding ?? EdgeInsets.zero,
          child: Text(
            text,
            style: textStyle,
            textScaleFactor: 1.0,
            textAlign: textAlign ?? TextAlign.start,
          ),
        ));
  }
}
