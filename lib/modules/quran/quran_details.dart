import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/modules/quran/quran_screen.dart';

import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "quranview";

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  String content = "";
  List<String> allVerses = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as suraDetails;
    if (content.isEmpty) {
      readfiles(arg.suraNumber);
    }
    var mediaquery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(appProvider.backgroundImage()),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("اسلامي"),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: mediaquery.width,
            height: mediaquery.height,
            margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 120),
            decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " سورة ${arg.suraName}",
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.play_circle,
                      size: 30,
                      color: theme.colorScheme.onSecondary,
                    ),
                  ],
                ),
                Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 2,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Text(
                      content,
                      style: theme.textTheme.bodySmall!.copyWith(height: 1.6),
                      textAlign: TextAlign.center,
                    ),
                    itemCount: 1,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  readfiles(String index) async {
    String text = await rootBundle.loadString("assets/files/$index.txt");
    content = text;

    setState(() {
      allVerses = content.split("\n");
    });
  }
}
