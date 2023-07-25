import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:intikom_app/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:intikom_app/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:intikom_app/infrastructure/ext/ctx_ext.dart';
import 'package:intikom_app/infrastructure/ext/double_ext.dart';
import 'package:intikom_app/infrastructure/routing/router.gr.dart';
import 'package:intikom_app/infrastructure/service_locator/service_locator.dart';
import 'package:intikom_app/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:intikom_app/infrastructure/widgets/form/text_field.dart';
import 'package:intikom_app/infrastructure/widgets/loading/overlay.dart';
import 'package:intikom_app/modules/authentication/presentation/screens/login/cubit/login_cubit.dart';

part 'widgets/form.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        body: Center(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginSuccess) {
                context.read<SessionCubit>().setCurrentUser(state.session);
                context.router.replace(const HomeRoute());
              }
            },
            child: Stack(
              children: [
                const Align(alignment: Alignment.center, child: _LoginForm()),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginError) {
                      context.messenger.showErrorSnackbar(state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is! LoginLoading) {
                      return const SizedBox();
                    }
                    return const UFLoadingOverlay();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
