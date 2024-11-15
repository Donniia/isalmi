import 'package:flutter/material.dart';

class QuranItem extends StatelessWidget {
  QuranItem({required this.suraName, required this.suraNumber});

  final String suraName;
  final String suraNumber;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
            child: Text(
          suraNumber,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.secondary),
          textAlign: TextAlign.center,
        )),
        Container(
          width: 1.2,
          height: 45,
            color: theme.colorScheme.onSecondary),
        Expanded(
            child: Text(
              suraName,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.secondary),
          textAlign: TextAlign.center,
        )),
      ],
    );
  }
}
