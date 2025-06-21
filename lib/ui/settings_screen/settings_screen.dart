import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/l10n/resumeflow_localizations_ar.dart';
import 'package:resumeflow/l10n/resumeflow_localizations_en.dart';
import 'package:resumeflow/repos/settings_repository/settings_repository.dart';
import 'package:resumeflow/ui/settings_screen/dropdown_tile/dropdown_tile.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';
import 'package:resumeflow/utils/gemini_models_enum/gemini_models_enum.dart';
import 'package:resumeflow/utils/locale_enum/locale_enum.dart';
import 'package:resumeflow/utils/platform_helper/platform_helper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsRepo = context.watch<SettingsRepository>();
    final l10n = ResumeflowLocalizations.of(context);
    final theme = Theme.of(context);
    final platformHelper = context.platformHelper;

    final settings = _buildSettings(platformHelper, theme, l10n, settingsRepo);
    return context.platformHelper.isCompact
        ? _buildCompact(settings, theme)
        : _buildWide(settings, theme);
  }

  Widget _buildCompact(Widget settings, ThemeData theme) =>
      Material(color: theme.colorScheme.surface, child: settings);

  Widget _buildWide(Widget settings, ThemeData theme) => Scaffold(
    body: GridBackground(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Material(color: theme.colorScheme.surface, child: settings),
          ),
        ),
      ),
    ),
  );

  Widget _buildSettings(
    PlatformHelper platformHelper,
    ThemeData theme,
    ResumeflowLocalizations l10n,
    SettingsRepository settingsRepo,
  ) => ConstrainedBox(
    constraints: BoxConstraints(maxWidth: 600),
    child: SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Material(
        color: theme.colorScheme.surface,
        child: Column(
          spacing: 5,
          children: [
            _buildLanguageTile(l10n, settingsRepo),
            _buildThemeTile(l10n, settingsRepo),
            StatefulBuilder(
              builder: (context, setState) {
                return _buildGeminiModelTile(l10n, settingsRepo, setState);
              },
            ),
            _buildSwitchBtn(l10n, settingsRepo),
            // Should be last
            _buildResetBtn(
              l10n,
              settingsRepo,
              theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    ),
  );

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
      onSelected:
          (themeMode) async =>
              await settingsRepo.themeModeLO.setObject(themeMode!),
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

  Widget _buildGeminiModelTile(
    ResumeflowLocalizations l10n,
    SettingsRepository settingsRepo,
    void Function(void Function()) setState,
  ) {
    return DropdownTile(
      label: l10n.aiModel,
      icon: Icons.model_training,
      initialSelection: settingsRepo.geminiModelsLO.object,
      dropdownMenuEntries:
          GeminiModelsEnum.values
              .map<DropdownMenuEntry<GeminiModelsEnum>>(
                (modelEnum) =>
                    DropdownMenuEntry(value: modelEnum, label: modelEnum.name),
              )
              .toList(),
      onSelected: (modelEnum) async {
        await settingsRepo.geminiModelsLO.setObject(modelEnum!);
        setState(() {});
      },
    );
  }

  Widget _buildResetBtn(
    ResumeflowLocalizations l10n,
    SettingsRepository settingsRepo,
    TextStyle textStyle,
  ) {
    return OutlinedButton(
      onPressed: () async => await settingsRepo.reset(),
      child: Text(l10n.resetSettings, style: textStyle),
    );
  }

  Widget _buildSwitchBtn(
    ResumeflowLocalizations l10n,
    SettingsRepository settingsRepo,
  ) => SwitchListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    title: Row(
      spacing: 5,
      children: [Icon(Icons.preview), Text(l10n.resumePreview)],
    ),
    value: settingsRepo.previewResumeLO.object,
    onChanged: (value) async {
      await settingsRepo.previewResumeLO.setObject(value);
    },
  );
}
