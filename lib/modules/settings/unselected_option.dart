import 'package:flutter/material.dart';

class UnselectedOption extends StatelessWidget {
  final String unselectedTitle;
  const UnselectedOption({required this.unselectedTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.white10,
      ),
      child: Text(unselectedTitle,)
    );
  }
}
