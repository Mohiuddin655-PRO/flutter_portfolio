import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'index.dart';

Future<void> main() async {
  await diInit();
  setPathUrlStrategy();
  runApp(AndrossyProvider(
    androssy: Androssy.from(di()),
    configure: await AndrossyConfigure.config(
      instances: [
        di<SharedPreferences>(),
      ],
    ),
    localizer: AndrossyLocalizer.fromJson(
      await rootBundle.loadString("assets/contents/localizations.json"),
    ),
    child: const Application(),
  ));
}

class Application extends StatelessWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AndrossyBuilder(
      builder: (context, value) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppInfo.name,
          locale: value.settings.locale,
          themeMode: value.settings.theme,
          theme: theme.light,
          darkTheme: theme.dark,
          routerConfig: AppRouter.I.router,
        );
      },
    );
  }
}
