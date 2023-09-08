import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../index.dart';

class BlogsFragment extends BaseFragment<BlogsFragmentController> {
  const BlogsFragment({
    super.key,
    required super.instance,
  });

  @override
  BlogsFragmentController init(BuildContext context) {
    return BlogsFragmentController();
  }

  @override
  Widget onCreate(context, controller) {
    return const TextView(
      width: double.infinity,
      height: double.infinity,
      gravity: Alignment.center,
      text: "Blogs",
      textColor: Colors.grey,
      textFontWeight: FontWeight.w300,
      textSize: 42,
    );
  }
}
