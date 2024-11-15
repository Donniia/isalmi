import 'package:flutter/material.dart';
import 'package:islamic_app/modules/settings/selected_option.dart';
import 'package:islamic_app/modules/settings/unselected_option.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/provider/app_provider.dart';

class ThemeSheet extends StatelessWidget {
  const ThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    var applocal = AppLocalizations.of(context);
    return Container(
      color: theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  appProvider.changeTheme(ThemeMode.dark);
                  Navigator.pop(context);
                },
                child: appProvider.isDark()
                    ? SelectedOption(
                        selectedtitle: applocal!.dark,
                      )
                    : UnselectedOption(unselectedTitle:applocal!.dark)),
           const SizedBox(
              height: 25,
            ),
            GestureDetector(
                onTap: () {
                  appProvider.changeTheme(ThemeMode.light);
                  Navigator.pop(context);
                },
                child: appProvider.isDark()
                    ? UnselectedOption(unselectedTitle: applocal.light)
                    : SelectedOption(
                        selectedtitle: applocal.light,
                      ))
          ],
        ),
      ),
    );
  }
}
