import 'package:flutter/material.dart';
import 'package:islamic_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/provider/app_provider.dart';
import 'modules/hadeth/hadeth_screen.dart';
import 'modules/quran/quran_screen.dart';
import 'modules/radio/radio_screen.dart';
import 'modules/sebha/sebha_screen.dart';
import 'modules/settings/settings_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    Quran(),
    Hadeth(),
    Sebha(),
    Radio_screen(),
    Settings(),
  ];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(appProvider.backgroundImage()),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(AppLocalizations.of(context)!.islami),
          ),
          body: screens[selectedindex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                selectedindex = index;
              });
            },
            currentIndex: selectedindex,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/hadeth.png")),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings),
            ],
          ),
        ));
  }
}
