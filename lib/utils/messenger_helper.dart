import 'package:flutter/material.dart';

class MessengerHelper {
  final BuildContext context;

  const MessengerHelper._(this.context);

  static MessengerHelper? _proxy;

  static MessengerHelper of(BuildContext context) {
    return _proxy ??= MessengerHelper._(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
