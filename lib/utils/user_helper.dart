import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_andomie/core.dart';

import '../../index.dart';

class UserHelper {
  const UserHelper._();

  static auth.User? get firebaseUser => auth.FirebaseAuth.instance.currentUser;

  static String get uid => user?.id ?? "";

  static User? get user => getUser(di<UserPreference>());

  static User? getUser([UserPreference? preference]) {
    return UserPreference.getUser(preference);
  }

  static Future<bool> setUser(UserPreference preference, User user) {
    return preference.setUser(user);
  }

  static bool get isAuthenticated => firebaseUser != null;

  static String getUid([UserPreference? preference]) {
    return getUser(preference)?.id ?? "";
  }

  static String getEmail([UserPreference? preference]) {
    return getUser(preference)?.email ?? "";
  }

  static bool isCurrentUid(String uid) => Validator.isMatched(getUid(), uid);

  static bool isValidUser(UserPreference preferences) {
    final user = preferences.user;
    final a = Validator.isValidString(user.id);
    final b = Validator.isValidString(user.name);
    final c = Validator.isValidEmail(user.email);
    return a && b && c;
  }

  static void signOut(UserPreference preference) {
    preference.setUser(null);
    auth.FirebaseAuth.instance.signOut();
  }
}

extension UserHelperExtension on String {
  bool get isCurrentUid => UserHelper.isCurrentUid(this);
}
