import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data.dart';
import 'package:flutter/material.dart';

class CrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const CrediDropdownWidget({Key? key, required this.onKrediSecildi})
      : super(key: key);

  @override
  _CrediDropdownWidgetState createState() => _CrediDropdownWidgetState();
}

class _CrediDropdownWidgetState extends State<CrediDropdownWidget> {
   double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constants.borderSmallRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.mainColor,
        value: secilenKrediDegeri,
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            widget.onKrediSecildi(deger);
          });
        },
        underline: Container(),
        items: DataHelper.allCrediesOfLesson(),
      ),
    );
  }
}
