import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../index.dart';

class ServicesFragment extends BaseFragment<ServicesFragmentController> {
  const ServicesFragment({
    super.key,
    required super.instance,
  });

  @override
  ServicesFragmentController init(BuildContext context) {
    return ServicesFragmentController();
  }

  @override
  Widget onCreate(context, controller) {
    return const TextView(
      width: double.infinity,
      height: double.infinity,
      gravity: Alignment.center,
      text: "Services",
      textColor: Colors.grey,
      textFontWeight: FontWeight.w300,
      textSize: 42,
    );
  }
}
