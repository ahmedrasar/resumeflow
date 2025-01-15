import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/resumeflow_localizations.dart';
import 'package:provider/provider.dart';
import 'package:resumeflow/repos/settings_repo/settings_repo.dart';
import 'package:resumeflow/utils/locale_enum/locale_enum.dart';

import '../widgets/grid_background.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, this.popCallback});

  final void Function()? popCallback;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsRepo = context.read<SettingsRepository>();
    final l10n = ResumeflowLocalizations.of(context);

    final inputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      filled: true,
      fillColor: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
    );

    return Scaffold(
      body: GridBackground(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.language_outlined),
                  title: Text(
                    l10n.languageText,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  trailing: DropdownMenu<LocaleEnum>(
                    width: 120,
                    inputDecorationTheme: inputDecorationTheme,
                    initialSelection: settingsRepo.localeLO.object,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                          value: LocaleEnum.system, label: l10n.systemLangText),
                      DropdownMenuEntry(
                          value: LocaleEnum.english,
                          label: LocaleEnum.english.nativeName!),
                      DropdownMenuEntry(
                          value: LocaleEnum.arabic,
                          label: LocaleEnum.arabic.nativeName!),
                    ],
                    onSelected: (locale) async =>
                        await settingsRepo.localeLO.setObject(locale!),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.color_lens_outlined),
                  title: Text(
                    l10n.themeBtnText,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  trailing: DropdownMenu<ThemeMode>(
                    width: 150,
                    inputDecorationTheme: inputDecorationTheme,
                    initialSelection: settingsRepo.themeModeLO.object,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                          value: ThemeMode.system, label: l10n.systemThemeText),
                      DropdownMenuEntry(
                          value: ThemeMode.light, label: l10n.lightThemeText),
                      DropdownMenuEntry(
                          value: ThemeMode.dark, label: l10n.darkThemeText),
                    ],
                    onSelected: (themeMode) =>
                        settingsRepo.themeModeLO.setObject(themeMode!),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
