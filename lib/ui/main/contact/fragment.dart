import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../index.dart';

class ContactFragment extends BaseFragment<ContactFragmentController> {
  const ContactFragment({
    super.key,
    required super.instance,
  });

  @override
  ContactFragmentController init(BuildContext context) {
    return ContactFragmentController();
  }

  @override
  Widget onCreate(context, controller) {
    return const TextView(
      width: double.infinity,
      height: double.infinity,
      gravity: Alignment.center,
      text: "Contact",
      textColor: Colors.grey,
      textFontWeight: FontWeight.w300,
      textSize: 42,
    );
  }
}
