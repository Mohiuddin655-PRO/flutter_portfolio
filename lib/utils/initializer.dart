library preferences;

import 'package:flutter_andomie/core.dart';

import '../index.dart';

class Initializer {
  static PreferenceHelper get preferenceHelper => di<PreferenceHelper>();

  static ScreenPreferenceHelper get screenPreferenceHelper {
    return di<ScreenPreferenceHelper>();
  }

  static BooleanPreferenceHelper get booleanPreferenceHelper {
    return di<BooleanPreferenceHelper>();
  }

  static DataPreferenceHelper get dataPreferenceHelper {
    return di<DataPreferenceHelper>();
  }
}

class Preferences {
  static PreferenceHelper get I {
    return Initializer.preferenceHelper;
  }

  static DataPreferenceHelper get data {
    return Initializer.dataPreferenceHelper;
  }

  static BooleanPreferenceHelper get boolean {
    return Initializer.booleanPreferenceHelper;
  }

  static ScreenPreferenceHelper get screen {
    return Initializer.screenPreferenceHelper;
  }
}
