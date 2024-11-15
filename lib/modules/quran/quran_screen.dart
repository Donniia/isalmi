import 'package:flutter/material.dart';
import 'package:islamic_app/modules/quran/quran_details.dart';
import 'package:islamic_app/modules/quran/quranitem.dart';


class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  List<String> suranames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/quran2.png"),
        Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              "رقم السورة",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.colorScheme.secondary),
              textAlign: TextAlign.center,
            )),
            Container(
              width: 1.2,
              height: 45,
                color: theme.colorScheme.onSecondary),
            Expanded(
                child: Text(
                  "اسم السورة",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.colorScheme.secondary),
              textAlign: TextAlign.center,
            )),
          ],
        ),
        Divider(
          thickness: 1.2,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: suranames.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, QuranDetails.routeName,
                            arguments: suraDetails(
                                suraName: suranames[index],
                                suraNumber: "${index + 1}"));
                      },
                      child: QuranItem(
                          suraName: suranames[index],
                          suraNumber: "${index + 1}"),
                    )))
      ],
    );
  }
}

class suraDetails {
  String suraName;
  String suraNumber;

  suraDetails({required this.suraName, required this.suraNumber});
}
