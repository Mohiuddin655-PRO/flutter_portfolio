import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../index.dart';

class AboutFragment extends BaseFragment<AboutFragmentController> {
  const AboutFragment({
    super.key,
    required super.instance,
  });

  @override
  AboutFragmentController init(BuildContext context) {
    return AboutFragmentController();
  }

  @override
  Widget onCreate(context, controller) {
    return LinearLayout(
      width: double.infinity,
      children: [
        AboutUserDetailsSegment(
          translate: translate,
          themeColor: themeColor,
        ),
      ],
    );
  }
}
