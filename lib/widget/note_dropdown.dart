import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data.dart';
import 'package:flutter/material.dart';

class NoteDropdownWidget extends StatefulWidget {
   final Function onHarfSecildi;
  const NoteDropdownWidget({Key? key, required this.onHarfSecildi})
      : super(key: key);
 
  @override
  _NoteDropdownWidgetState createState() => _NoteDropdownWidgetState();
}

class _NoteDropdownWidgetState extends State<NoteDropdownWidget> {
  double secilenDeger = 4;
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
        value: secilenDeger,
        onChanged: (deger) {
          setState(() {
            secilenDeger = deger!;
            widget.onHarfSecildi(deger);
          });
        },
        underline: Container(),
        items: DataHelper.allCrediOfLesson(),
      ),
    );
  }
}
