import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../index.dart';

class MainActivity extends BaseActivity<MainActivityController> {
  final Object? data;
  final ScreenType type;

  const MainActivity({
    super.key,
    this.type = ScreenType.about,
    this.data,
  });

  @override
  MainActivityController init(BuildContext context) {
    return MainActivityController();
  }

  @override
  AppBar? onCreateAppbar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      centerTitle: true,
      titleSpacing: 0,
      title: ToolbarNavigation(
        controller: controller.navController,
        currentIndex: controller.getIndexFromType(type),
        widthMax: 1280,
        paddingHorizontal: 24,
        items: const [
          ToolbarNavigationItem(
            title: "About",
          ),
          ToolbarNavigationItem(
            title: "Projects",
          ),
          ToolbarNavigationItem(
            title: "Services",
          ),
          ToolbarNavigationItem(
            title: "Blogs",
          ),
          ToolbarNavigationItem(
            title: "Contact",
          ),
        ],
      ),
      actions: [
        IconView(
          activated: instance.isDarkTheme,
          marginEnd: 24,
          iconState: const ValueState(
            primary: Icons.light_mode_outlined,
            secondary: Icons.dark_mode_outlined,
          ),
          onToggle: (v) {
            instance.setThemeMode(v ? ThemeMode.light : ThemeMode.dark);
          },
        ),
      ],
    );
  }

  @override
  Widget onCreate(context, instance) {
    return MainBody(
      instance: instance,
      type: type,
    );
  }
}

class MainBody extends StatelessWidget {
  final AndrossyInstance instance;
  final ScreenType type;

  const MainBody({
    super.key,
    required this.instance,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ScreenType.blogs:
        return BlogsFragment(instance: instance);
      case ScreenType.contact:
        return ContactFragment(instance: instance);
      case ScreenType.projects:
        return ProjectsFragment(instance: instance);
      case ScreenType.services:
        return ServicesFragment(instance: instance);
      default:
        return AboutFragment(instance: instance);
    }
  }
}
