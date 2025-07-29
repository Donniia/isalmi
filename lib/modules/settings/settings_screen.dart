import 'package:flutter/material.dart';
import 'package:islamic_app/core/provider/app_provider.dart';
import 'package:islamic_app/l10n/app_localizations.dart';
import 'package:islamic_app/modules/settings/settings_item.dart';
import 'package:islamic_app/modules/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';



import 'language_bottom_sheet.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    var applocal = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsItem(
            OptionTitle: applocal!.language,
            onOptionTaped: () {
              showLanguage(context);
            },
            selectedOption:appProvider.isEnglish()? applocal!.english : applocal!.arabic,
          ),
          const SizedBox(
            height: 20,
          ),
          SettingsItem(
            OptionTitle: applocal!.mode,
            onOptionTaped: () {
              showTheme(context);
            },
            selectedOption:
                appProvider.isDark() ? applocal!.dark : applocal!.light,
          ),
        ],
      ),
    );
  }

  showLanguage(context) {
    showModalBottomSheet(
        context: context, builder: (context) => languageSheet());
  }

  showTheme(context) {
    showModalBottomSheet(context: context, builder: (context) => ThemeSheet());
  }
}
