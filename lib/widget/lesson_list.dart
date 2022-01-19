import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data.dart';
import 'package:dinamik_ortalama_hesaplama/model/lesson.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({Key? key, required this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> tumDersler = DataHelper.allAddingLessons;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].lesson),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text('' +
                            (tumDersler[index].credi *
                                    tumDersler[index].note)
                                .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].credi} Kredi, Not Değeri ${tumDersler[index].note}'),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
              "Lütfen ders giriniz.",
              style: Constants.headStyle,
            ),
          );
  }
}
