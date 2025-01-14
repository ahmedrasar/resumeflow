import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/resumeflow_localizations.dart';
import 'package:resumeflow/ui/settings_screen/settings_screen.dart';
import 'package:resumeflow/utils/adaptive_helper/adaptive_helper.dart';

import 'coverletter_dashboard_page.dart';
import 'resume_dashboard_page.dart';
import '../widgets/resumeflow_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentPageIndex = 0;
  void _changeDestination(int index) => setState(() {
        _currentPageIndex = index;
      });

  Widget _buildWideView() {
    final l10n = ResumeflowLocalizations.of(context);

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _currentPageIndex,
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
                label: Text(l10n.resumeText),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.mail),
                label: Text(l10n.coverletterText),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text(l10n.settingsText),
              ),
            ],
            onDestinationSelected: _changeDestination,
          ),
          Expanded(
            child: IndexedStack(
              index: _currentPageIndex,
              children: [
                ResumeDashboardPage(),
                CoverletterDashboardPage(),
                SettingsScreen(
                  isCompact: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactView() {
    final l10n = ResumeflowLocalizations.of(context);

    if (_currentPageIndex == 2) return SettingsScreen();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Hero(tag: ResumeflowLogo.heroTag, child: ResumeflowLogo()),
        ),
        leadingWidth: 40,
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPageIndex,
        onDestinationSelected: _changeDestination,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.article),
            label: l10n.resumeText,
          ),
          NavigationDestination(
            icon: Icon(Icons.mail),
            label: l10n.coverletterText,
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentPageIndex,
        children: [
          ResumeDashboardPage(),
          CoverletterDashboardPage(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final adaptiveHelper =
        AdaptiveHelper(width: MediaQuery.sizeOf(context).width);

    return adaptiveHelper.isWide() ? _buildWideView() : _buildCompactView();
  }
}
