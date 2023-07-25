import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intikom_app/infrastructure/ext/ctx_ext.dart';
import 'package:intikom_app/infrastructure/ext/double_ext.dart';
import 'package:intikom_app/infrastructure/routing/router.gr.dart';
import 'package:intikom_app/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:intikom_app/infrastructure/widgets/buttons/outlined_button.dart';
import 'package:intikom_app/modules/authentication/presentation/widgets/logged_in_wrapper.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthenticatedWrapper(child: _HomeScreenContent());
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current User: ${context.userSession.user.userName}'),
        actions: [
          UFOutlinedButton(
            textStyle: context.text.bodyMedium
                ?.copyWith(color: context.color.background),
            label: 'Logout',
            outlinedColor: context.color.background,
            onPressed: () {
              context.logout();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            UFElevatedButton(
                label: "Case 1",
                suffixIcon: const Icon(Icons.arrow_right),
                onPressed: () {
                  context.router.push(const CaseOneRoute());
                }),
            40.verticalSpace,
            UFElevatedButton(
                label: "Case 2",
                suffixIcon: const Icon(Icons.arrow_right),
                onPressed: () {
                  context.router.push(const CaseTwoHomeRoute());
                }),
          ],
        ),
      ),
    );
  }
}
