import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../index.dart';

class ProjectsFragment extends BaseFragment<ProjectsFragmentController> {
  const ProjectsFragment({
    super.key,
    required super.instance,
  });

  @override
  ProjectsFragmentController init(BuildContext context) {
    return ProjectsFragmentController();
  }

  @override
  Widget onCreate(context, controller) {
    return const TextView(
      width: double.infinity,
      height: double.infinity,
      gravity: Alignment.center,
      text: "Projects",
      textColor: Colors.grey,
      textFontWeight: FontWeight.w300,
      textSize: 42,
    );
  }
}
