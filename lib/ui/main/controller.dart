import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_app_navigator/app_navigator.dart';

import '../../index.dart';

class MainActivityController extends AndrossyController {
  /// Buttons
  ToolbarNavigationController navController = ToolbarNavigationController();

  int getIndexFromType(ScreenType type) {
    if (type == ScreenType.about) {
      return 0;
    } else if (type == ScreenType.projects) {
      return 1;
    } else if (type == ScreenType.services) {
      return 2;
    } else if (type == ScreenType.blogs) {
      return 3;
    } else if (type == ScreenType.contact) {
      return 4;
    } else {
      return 0;
    }
  }

  @override
  void onInit(BuildContext context) {}

  @override
  void onListener(BuildContext context) {
    navController.setOnItemIndexChangeListener((context, index) {
      if (index == 0) {
        loadScreen(context, ScreenType.about);
      } else if (index == 1) {
        loadScreen(context, ScreenType.projects);
      } else if (index == 2) {
        loadScreen(context, ScreenType.services);
      } else if (index == 3) {
        loadScreen(context, ScreenType.blogs);
      } else if (index == 4) {
        loadScreen(context, ScreenType.contact);
      } else {
        loadScreen(context, ScreenType.about);
      }
    });
  }

  void loadScreen(BuildContext context, ScreenType type, [Object? data]) {
    AppNavigator.of(context).go(
      ScreenType.main.route,
      path: type.route,
      extra: {"data": data},
    );
  }
}
