import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:cochise/common/navigation/router/router.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

class CochiseApp extends StatelessWidget {
  const CochiseApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const basilTheme = BasilTheme();
    final mApp = MaterialApp.router(
      routerConfig: router,
      builder: Authenticator.builder(),
      theme: basilTheme.toThemeData(),
    );
    return Authenticator(
      child: mApp,
    );
  }
}