import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class HomeToolbarButton extends StatelessWidget {
  final TextViewController? controller;
  final String text;
  final OnViewClickListener? onClick;

  const HomeToolbarButton({
    super.key,
    this.controller,
    required this.text,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return TextView(
      controller: controller,
      text: text,
      textColor: context.primaryColor,
      textFontWeight: FontWeight.w600,
      paddingHorizontal: 16,
      paddingVertical: 8,
      borderRadius: 8,
      background: Colors.transparent,
      rippleColor: context.primaryColor.withAlpha(15),
      onClick: onClick,
    );
  }
}
