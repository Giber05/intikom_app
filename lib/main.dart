import 'package:flutter/material.dart';
import 'package:intikom_app/app.dart';
import 'package:intikom_app/infrastructure/architecutre/error_handler/global_error_handler.dart';
import 'package:intikom_app/infrastructure/env/env.dart';
import 'package:intikom_app/infrastructure/routing/router.dart';
import 'package:intikom_app/infrastructure/service_locator/service_locator.dart';

void main() async {
  await configureDependencies();
  IntikomGlobalErrorHandler.setUpErrorHandler();
  ENV.setEnv(ENV.dev);
  runApp(IntikomApp(
    appRouter: AppRouter(),
  ));
}
