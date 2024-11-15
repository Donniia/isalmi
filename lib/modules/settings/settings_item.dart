import 'package:flutter/material.dart';

typedef optionClicked = void Function();

class SettingsItem extends StatelessWidget {
  final String OptionTitle;
  final optionClicked onOptionTaped;
  final String selectedOption;
  const SettingsItem({required this.OptionTitle, required this.onOptionTaped,required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(OptionTitle,style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.secondary
        ), textAlign: TextAlign.start,),
        GestureDetector(
          onTap: onOptionTaped,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            height: 50,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color:theme.colorScheme.onSecondary
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedOption,style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.secondary
                ),),
                Icon(Icons.arrow_drop_down,color: theme.colorScheme.onSecondary,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
