import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/ui/tutorial_screen/tutorial_grid.dart';
import 'package:resumeflow/utils/layout_helper/layout_helper.dart';

import '../widgets/grid_background.dart';
import '../widgets/resumeflow_logo.dart';

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  static const _buttonWidth = 300.0;
  static const _buttonHeight = 50.0;

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  '${ResumeflowLocalizations.of(context).startScreenHeaderSeg1}\n',
              style: Theme.of(context).textTheme.displayMedium,
              children: [
                TextSpan(
                  text:
                      '${ResumeflowLocalizations.of(context).startScreenHeaderSeg2}\n',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                TextSpan(
                    text: ResumeflowLocalizations.of(context)
                        .startScreenHeaderBody,
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget __buildBaseButton(
      final String text, final Color textColor, final Color backgroundColor,
      [final void Function()? onPressed]) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          fixedSize:
              const WidgetStatePropertyAll(Size(_buttonWidth, _buttonHeight)),
          backgroundColor: WidgetStatePropertyAll(backgroundColor)),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) => __buildBaseButton(
      ResumeflowLocalizations.of(context).getStartedButtonTitle,
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.onSecondary,
      () => context.go('/home'));

  Widget _buildLearnMoreButton(BuildContext context) => __buildBaseButton(
      ResumeflowLocalizations.of(context).learnMoreButtonTitle,
      Theme.of(context).colorScheme.inverseSurface,
      Theme.of(context).colorScheme.onInverseSurface,
      () => context.go('/tutorial'));

  Widget _buildHowItWorksHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          ResumeflowLocalizations.of(context).howItWorksHeader,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          ResumeflowLocalizations.of(context).howItWorksBody,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final adaptiveHelper =
        AdaptiveHelper(width: MediaQuery.sizeOf(context).width);

    return Scaffold(
      body: GridBackground(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Hero(
                        tag: ResumeflowLogo.heroTag,
                        child: ResumeflowLogo(),
                      ),
                    ),
                  ),
                  _buildHeader(context),
                  _buildGetStartedButton(context),
                  _buildHowItWorksHeader(context),
                  adaptiveHelper.isCompact()
                      ? _buildLearnMoreButton(context)
                      : TutorialGrid(),
                  SizedBox(height: 40)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
