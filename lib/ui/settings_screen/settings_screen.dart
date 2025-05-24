import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/l10n/resumeflow_localizations_ar.dart';
import 'package:resumeflow/l10n/resumeflow_localizations_en.dart';
import 'package:resumeflow/repos/settings_repository/settings_repository.dart';
import 'package:resumeflow/ui/settings_screen/dropdown_tile/dropdown_tile.dart';
import 'package:resumeflow/utils/locale_enum/locale_enum.dart';

import '../widgets/grid_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsRepo = context.read<SettingsRepository>();
    final l10n = ResumeflowLocalizations.of(context);

    return Scaffold(
      body: GridBackground(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                spacing: 10,
                children: [
                  _buildLanguageTile(l10n, settingsRepo),
                  _buildThemeTile(l10n, settingsRepo),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThemeTile(
    ResumeflowLocalizations l10n,
    SettingsRepository settingsRepo,
  ) {
    return DropdownTile(
      label: l10n.theme,
      icon: Icons.color_lens_outlined,
      initialSelection: settingsRepo.themeModeLO.object,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: ThemeMode.system, label: l10n.systemTheme),
        DropdownMenuEntry(value: ThemeMode.light, label: l10n.lightTheme),
        DropdownMenuEntry(value: ThemeMode.dark, label: l10n.darkTheme),
      ],
      onSelected: (themeMode) => settingsRepo.themeModeLO.setObject(themeMode!),
    );
  }

  Widget _buildLanguageTile(
    ResumeflowLocalizations l10n,
    SettingsRepository settingsRepo,
  ) {
    return DropdownTile(
      label: l10n.language,
      icon: Icons.language_outlined,
      initialSelection: settingsRepo.localeLO.object,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: LocaleEnum.system, label: l10n.systemLanguage),
        DropdownMenuEntry(
          value: LocaleEnum.english,
          label: ResumeflowLocalizationsEn().nativeName,
        ),
        DropdownMenuEntry(
          value: LocaleEnum.arabic,
          label: ResumeflowLocalizationsAr().nativeName,
        ),
      ],
      onSelected:
          (locale) async => await settingsRepo.localeLO.setObject(locale!),
    );
  }
}
