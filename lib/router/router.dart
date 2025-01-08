import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/ui/settings_screen/settings_screen.dart';

import '../ui/resume_screen/create_resume_screen.dart';
import '../ui/home_screen/home_screen.dart';
import '../ui/showcase_screen/showcase_screen.dart';
import '../ui/tutorial_screen/tutorial_screen.dart';
import '../ui/auth_screen/login_screen.dart';
import 'not_found_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => NotFoundScreen(state),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ShowcaseScreen(),
      routes: [
        GoRoute(
          path: '/tutorial',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const TutorialScreen(),
              transitionDuration: Durations.medium1,
              reverseTransitionDuration: Durations.medium1,
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  OpenUpwardsPageTransitionsBuilder().buildTransitions(
                      null, context, animation, secondaryAnimation, child),
            );
          },
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: '/create',
              builder: (context, state) => const CreateResumeScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
