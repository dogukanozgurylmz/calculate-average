import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const ShowAverage(
      {Key? key, required this.dersSayisi, required this.ortalama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders girildi" : "Ders seçiniz.",
          style: Constants.showAverageBodyStyle,
        ),
        Text(
          ortalama >= 0 ? ortalama.toStringAsFixed(2) : "0.0",
          style: Constants.ortalamaStyle,
        ),
        Text(
          "ortalama",
          style: Constants.showAverageBodyStyle,
        )
      ],
    );
  }
}
