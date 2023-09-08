import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';

abstract class BaseActivity<T extends AndrossyController>
    extends AndrossyActivity<T> {
  final bool hideToolbar;
  final String title;
  final double? elevation;

  const BaseActivity({
    super.key,
    this.title = "",
    this.elevation,
    this.hideToolbar = false,
  });

  @override
  T init(BuildContext context) {
    return AndrossyController() as T;
  }

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return AndrossyAppbarConfig(
      toolbarHeight: hideToolbar ? 0 : null,
      elevation: hideToolbar ? 0 : elevation,
    );
  }

  @override
  Widget? onCreateTitle(BuildContext context) {
    return title.isNotEmpty ? Text(translate(title)) : null;
  }
}
