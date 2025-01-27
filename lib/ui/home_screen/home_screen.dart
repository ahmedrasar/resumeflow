import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/utils/layout_helper/layout_helper.dart';

import '../widgets/resumeflow_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.shell});
  static const settingsBranchIndex = 2;

  final StatefulNavigationShell shell;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _previousBranchIndex = 0;

  @override
  didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.shell.currentIndex != widget.shell.currentIndex) {
      _previousBranchIndex = oldWidget.shell.currentIndex;
    }
  }

  Widget _buildWideView() {
    final l10n = ResumeflowLocalizations.of(context);

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: widget.shell.currentIndex,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                width: 40,
                child: Hero(
                  tag: ResumeflowLogo.heroTag,
                  child: ResumeflowLogo(),
                ),
              ),
            ),
            elevation: 5,
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.article),
                label: Text(l10n.resume),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.mail),
                label: Text(l10n.coverLetter),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text(l10n.settings),
              ),
            ],
            onDestinationSelected: widget.shell.goBranch,
          ),
          Expanded(child: widget.shell),
        ],
      ),
    );
  }

  Widget _buildCompactView() {
    final l10n = ResumeflowLocalizations.of(context);

    settingsIconCallback(Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Theme.of(context).colorScheme.primary.withAlpha(100);
      } else {
        return Colors.transparent;
      }
    }

    final isSettings =
        widget.shell.currentIndex == HomeScreen.settingsBranchIndex;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Hero(tag: ResumeflowLogo.heroTag, child: ResumeflowLogo()),
        ),
        leadingWidth: 40,
        actions: [
          IconButton(
            isSelected: isSettings,
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateColor.resolveWith(settingsIconCallback),
            ),
            onPressed: isSettings
                ? () => widget.shell.goBranch(_previousBranchIndex)
                : () => widget.shell.goBranch(HomeScreen.settingsBranchIndex),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      bottomNavigationBar: isSettings
          ? null
          : NavigationBar(
              selectedIndex: widget.shell.currentIndex,
              onDestinationSelected: widget.shell.goBranch,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.article),
                  label: l10n.resume,
                ),
                NavigationDestination(
                  icon: Icon(Icons.mail),
                  label: l10n.coverLetter,
                ),
              ],
            ),
      body: widget.shell,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCompact =
        LayoutHelper(width: MediaQuery.sizeOf(context).width).isCompact();

    return isCompact ? _buildCompactView() : _buildWideView();
  }
}
