import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double angle = 0;
  int counter = 0;
  List<String> text=[
    "سبحان الله",
    "الحمدالله",
    "الله اكبر",
  ];
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.09),
                  child: Transform.rotate(
                      angle: angle,
                      child: Theme(
                        data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent),
                        child: InkWell(
                          onTap: () {
                            onClick();
                          },
                          child: Image.asset(
                            "assets/images/body_sebha_logo.png",
                            height: size.height * 0.25,
                          ),
                        ),
                      ))),
              Container(
                  margin: EdgeInsets.only(left: size.width * 0.1),
                  child: Image.asset("assets/images/head_sebha_logo.png",
                      height: size.height * 0.1)),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "عدد التسبيحات",
                style: theme.textTheme.bodyLarge,
              )),
          Container(
            margin: EdgeInsets.only(top: 26),
            alignment: Alignment.center,
            height: 81,
            width: 69,
            decoration: BoxDecoration(
                color: Color(0xffB7935F),
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              "$counter",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 22),
            alignment: Alignment.center,
            height: 51,
            width: 137,
            decoration: BoxDecoration(
                color: Color(0xffB7935F),
                borderRadius: BorderRadius.circular(25)),
            child: Text(text[currentindex],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }

  onClick() {
    counter++;
    angle += 3;

    if (counter == 34) {
      counter = 0;
      currentindex++;
      if(currentindex>2){
        currentindex=0;
      }
    }
    setState(() {});
  }
}
