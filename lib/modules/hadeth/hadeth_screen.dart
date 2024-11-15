import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/modules/hadeth/hadeth_details.dart';


class Hadeth extends StatefulWidget {
  const Hadeth({super.key});

  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  @override
  List<hadethcontent> allhadthcontent = [];
  Widget build(BuildContext context) {
    if (allhadthcontent.isEmpty) readfiles();
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/hadeth_header.png"),
        Divider(
          thickness: 1.2,
        ),
        Text(
          "الاحاديث",
          style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.secondary
          ),
        ),
        Divider(
          thickness: 1.2,
        ),
        Expanded(
            child: ListView.builder(itemCount: allhadthcontent.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, HadethDetails.routeName,arguments: hadethcontent(title: allhadthcontent[index].title, content: allhadthcontent[index].content));
                    
                  },

                  child: Text(
                        allhadthcontent[index].title,
                        textAlign: TextAlign.center,
                    style:theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.secondary,
                      height: 2

                    ) ,
                      ),
                )
            ))
      ],
    );
  }

  readfiles() async {
    String allcontent = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadeth = allcontent.split("#");

    for (int i = 0; i < allHadeth.length; i++) {
      String singlehadeth = allHadeth[i].trim();
      int indexoftitle = singlehadeth.indexOf("\n");
      String title = singlehadeth.substring(0, indexoftitle);
      String content = singlehadeth.substring(indexoftitle + 1);

      hadethcontent hadeth = hadethcontent(title: title, content: content);

      setState(() {
        allhadthcontent.add(hadeth);
      });
    }
  }
}

class hadethcontent {
  String title;
  String content;

  hadethcontent({required this.title, required this.content});
}
