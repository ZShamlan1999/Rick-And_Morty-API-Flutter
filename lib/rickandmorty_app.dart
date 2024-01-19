import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

class RickandmortyApp extends StatelessWidget {
  const RickandmortyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
