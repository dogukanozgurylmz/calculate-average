// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:dinamik_ortalama_hesaplama/model/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Lesson> allAddingLessons = [];

  static addingLesson(Lesson lesson) {
    allAddingLessons.add(lesson);
  }

  static calculateAverage() {
    double totalNote = 0;
    int totalCredi = 0;

    allAddingLessons.forEach((element) {
      totalNote = totalNote + (element.credi * element.note);
      totalCredi += element.credi.toInt();
    });

    return totalNote / totalCredi;
  }

  static List<String> _allCrediOfLesson() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _crediToNote(String harf) {
    switch (harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allCrediOfLesson() {
    return _allCrediOfLesson()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _crediToNote(e),
            ))
        .toList();
  }

  static List<int> _allCredies() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCrediesOfLesson() {
    return _allCredies()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
