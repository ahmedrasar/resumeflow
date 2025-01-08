import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/resumeflow_localizations.dart';

import '../widgets/grid_background.dart';

class _ClerkCustomWidget extends StatefulWidget {
  const _ClerkCustomWidget();

  @override
  State<_ClerkCustomWidget> createState() => __ClerkCustomWidgetState();
}

class __ClerkCustomWidgetState extends State<_ClerkCustomWidget> {
  void __skipLogin(BuildContext context) {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => __skipLogin(context),
          child: Text(ResumeflowLocalizations.of(context).loginButtonTitle),
        ),
      ],
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const GridBackground(
      child: Scaffold(
        body: _ClerkCustomWidget(),
      ),
    );
  }
}
