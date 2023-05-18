import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'utils/constants.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gen Teste Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // platform: TargetPlatform.iOS,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black87,
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
