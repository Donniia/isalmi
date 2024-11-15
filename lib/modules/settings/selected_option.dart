import 'package:flutter/material.dart';

class SelectedOption extends StatelessWidget {
  final String selectedtitle;
  const SelectedOption({required this.selectedtitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          border:Border.all(
              color: theme.colorScheme.secondary
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(selectedtitle),
          Icon(Icons.check,color: theme.colorScheme.secondary,)
        ],
      ),
    );

  }
}
