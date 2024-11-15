import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/radio_provider.dart';

class Radio_screen extends StatelessWidget {
  const Radio_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider<RadioProvider>(
      create: (context) => RadioProvider()..getRadio(),
      builder: (newContext, child) {
        var pr = Provider.of<RadioProvider>(newContext);
        if (pr.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (pr.isError) {
          return const Center(
            child: Text("Error"),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/radio_image.png"),
            Text(
              pr.curRadio.name ?? "",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.colorScheme.secondary),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        pr.prev();
                      },
                      icon: ImageIcon(
                        AssetImage("assets/images/icon_left.png"),
                        color: theme.colorScheme.onSecondary,
                        size: 50,
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      onPressed: () {
                        pr.play();
                      },
                      icon: pr.isPlaying
                          ? Icon(Icons.pause,size: 40,color:theme.colorScheme.onSecondary ,)
                          : ImageIcon(
                              AssetImage("assets/images/icon_play.png"),
                              color: theme.colorScheme.onSecondary,
                              size: 40,
                            )),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      onPressed: () {
                        pr.next();
                      },
                      icon: ImageIcon(
                        AssetImage("assets/images/icon_right.png"),
                        color: theme.colorScheme.onSecondary,
                      )),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
