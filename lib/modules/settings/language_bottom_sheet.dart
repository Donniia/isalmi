import 'package:flutter/material.dart';
import 'package:islamic_app/core/provider/app_provider.dart';
import 'package:islamic_app/l10n/app_localizations.dart';
import 'package:islamic_app/modules/settings/selected_option.dart';
import 'package:islamic_app/modules/settings/unselected_option.dart';
import 'package:provider/provider.dart';

class languageSheet extends StatelessWidget {
  const languageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    var applocal = AppLocalizations.of(context);
    return Container(
      color: theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  appProvider.changeLanguage("en");
                  Navigator.pop(context);
                },
                child: appProvider.currentLanguage == "en"
                    ? SelectedOption(
                        selectedtitle: applocal!.english,
                      )
                    : UnselectedOption(unselectedTitle: applocal!.english)),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                appProvider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child: appProvider.currentLanguage == "ar"
                  ? SelectedOption(selectedtitle: applocal.arabic)
                  : UnselectedOption(unselectedTitle: applocal.arabic),
            )
          ],
        ),
      ),
    );
  }
}
