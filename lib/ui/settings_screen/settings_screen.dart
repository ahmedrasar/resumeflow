import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/repos/settings_repository/settings_repository.dart';
import 'package:resumeflow/utils/ai_model_enum/ai_model_enum.dart';
import 'package:resumeflow/utils/locale_enum/locale_enum.dart';

import '../widgets/grid_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsRepo = context.read<SettingsRepository>();
    final l10n = ResumeflowLocalizations.of(context);
    final theme = Theme.of(context);

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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                spacing: 10,
                children: [
                  Material(
                    color: theme.colorScheme.surface.withAlpha(200),
                    borderRadius: BorderRadius.circular(20),
                    child: ListTile(
                      minTileHeight: 75,
                      leading: Icon(Icons.language_outlined),
                      title: Text(
                        l10n.language,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      trailing: DropdownMenu<LocaleEnum>(
                        width: 150,
                        automaticMatching: true,
                        inputDecorationTheme: inputDecorationTheme,
                        initialSelection: settingsRepo.localeLO.object,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                              value: LocaleEnum.system,
                              label: l10n.systemLanguage),
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
                  ),
                  Material(
                    color: theme.colorScheme.surface.withAlpha(200),
                    borderRadius: BorderRadius.circular(20),
                    child: ListTile(
                      minTileHeight: 75,
                      leading: Icon(Icons.color_lens_outlined),
                      title: Text(
                        l10n.theme,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      trailing: DropdownMenu<ThemeMode>(
                        width: 150,
                        automaticMatching: true,
                        inputDecorationTheme: inputDecorationTheme,
                        initialSelection: settingsRepo.themeModeLO.object,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                              value: ThemeMode.system, label: l10n.systemTheme),
                          DropdownMenuEntry(
                              value: ThemeMode.light, label: l10n.lightTheme),
                          DropdownMenuEntry(
                              value: ThemeMode.dark, label: l10n.darkTheme),
                        ],
                        onSelected: (themeMode) =>
                            settingsRepo.themeModeLO.setObject(themeMode!),
                      ),
                    ),
                  ),
                  Material(
                    color: theme.colorScheme.surface.withAlpha(200),
                    borderRadius: BorderRadius.circular(20),
                    child: ListTile(
                      minTileHeight: 75,
                      leading: Icon(Icons.model_training_outlined),
                      title: Text(
                        l10n.aiModel,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      trailing: DropdownMenu<AiGenServiceEnum>(
                        width: 150,
                        automaticMatching: true,
                        inputDecorationTheme: inputDecorationTheme,
                        initialSelection: settingsRepo.aiModelLO.object,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                              value: AiGenServiceEnum.clientSide,
                              label: l10n.clientAiModel),
                          DropdownMenuEntry(
                              value: AiGenServiceEnum.serverSide,
                              label: l10n.serverAiModel),
                        ],
                        onSelected: (aiModelEnum) =>
                            settingsRepo.aiModelLO.setObject(aiModelEnum!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
