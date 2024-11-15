import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';
import 'hadeth_screen.dart';

class HadethDetails extends StatefulWidget {
  const HadethDetails({super.key});
  static const String routeName = "hadeth";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as hadethcontent;
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
                      arg.title,
                      style: theme.textTheme.bodyLarge
                    )
                  ],
                ),
                Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 2,
                ),
                Expanded(
                  child: ListView.builder(itemCount: 1,
                      itemBuilder: (context, index) => Text(
                            arg.content,
                            style: theme.textTheme.bodySmall!.copyWith(
                              height: 1.6
                            ),
                            textAlign: TextAlign.center,
                          )),
                )
              ],
            ),
          ),
        ));
  }
}
