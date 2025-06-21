import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/router/routes.dart';
import 'package:resumeflow/ui/document_screens/cover_letter_screen.dart';
import 'package:resumeflow/ui/dashboards/cover_letter_dashboard_page.dart';
import 'package:resumeflow/ui/dashboards/resumes_dashboard_page.dart';
import 'package:resumeflow/ui/document_screens/resume_screen.dart';
import 'package:resumeflow/ui/settings_screen/settings_screen.dart';
import 'package:resumeflow/ui/test.dart';

import '../ui/home_screen/home_screen.dart';
import '../ui/showcase_screen/showcase_screen.dart';
import '../ui/tutorial_screen/tutorial_screen.dart';
import '../ui/not_found_screen/not_found_screen.dart';

final router = GoRouter(
  initialLocation: AppRoutes.root.full,
  errorBuilder: (context, state) => NotFoundScreen(state),
  routes: [
    GoRoute(
      path: AppRoutes.root.self,
      builder: (context, state) => const ShowcaseScreen(),
      routes: [
        GoRoute(path: 'x', builder: (context, state) => TestScreen()),
        GoRoute(
          path: AppRoutes.tutorial.self,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const TutorialScreen(),
              transitionDuration: Durations.medium1,
              reverseTransitionDuration: Durations.medium1,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      OpenUpwardsPageTransitionsBuilder().buildTransitions(
                        null,
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.home.self,
          redirect: (context, state) {
            if (state.fullPath == AppRoutes.home.full) {
              return AppRoutes.coverLettersDashboard.full;
            }
            return null;
          },
          routes: [
            StatefulShellRoute.indexedStack(
              builder: (context, state, shell) => HomeScreen(shell: shell),
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoutes.resumeDashboard.self,
                      builder: (context, state) => ResumesDashboardPage(),
                      routes: [
                        GoRoute(
                          path: AppRoutes.resume.self,
                          builder: (context, state) => ResumeScreen(),
                        ),
                      ],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoutes.coverLettersDashboard.self,
                      builder: (context, state) => CoverLettersDashboardPage(),
                      routes: [
                        GoRoute(
                          path: AppRoutes.coverLetter.self,
                          builder: (context, state) => CoverLetterScreen(),
                        ),
                      ],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoutes.settings.self,
                      builder: (context, state) => SettingsScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
