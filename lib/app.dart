import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:intikom_app/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:intikom_app/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:intikom_app/infrastructure/architecutre/error_handler/global_errror_catcher.dart';
import 'package:intikom_app/infrastructure/ext/ctx_ext.dart';
import 'package:intikom_app/infrastructure/routing/router.dart';
import 'package:intikom_app/infrastructure/service_locator/service_locator.dart';
import 'package:intikom_app/infrastructure/styles/color.dart';
import 'package:intikom_app/infrastructure/styles/text.dart';

class IntikomApp extends StatelessWidget {
  final AppRouter appRouter;
  const IntikomApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MessengerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SessionCubit>(),
        ),
      ],
      child: Sizer(builder: (context, _, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          builder: (context, child) {
            return GlobalErrorCatcher(
              child: IntikomMessengerListener(
                child: child,
              ),
              onSessionExpire: () {
                context.messenger.showErrorSnackbar("Session Expired");
                context.logout();
              },
            );
          },
          routeInformationParser: appRouter.defaultRouteParser(),
          theme: ThemeData(
            textTheme: IntikomTextTheme.textTheme,
            colorScheme: IntikomTheme.lightScheme,
          ),
        );
      }),
    );
  }
}

class IntikomMessengerListener extends StatelessWidget {
  final Widget? child;
  const IntikomMessengerListener({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessengerCubit, MessengerState>(
      listener: (context, state) {
        if (state is MessengerIdle) return;
        if (state is MessengerSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: state.backgroundColor(context),
          ));
        }
        context.read<MessengerCubit>().idle();
      },
      child: child,
    );
  }
}
