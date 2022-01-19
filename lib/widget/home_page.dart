import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data.dart';
import 'package:dinamik_ortalama_hesaplama/model/lesson.dart';
import 'package:dinamik_ortalama_hesaplama/widget/lesson_list.dart';
import 'package:dinamik_ortalama_hesaplama/widget/note_dropdown.dart';
import 'package:dinamik_ortalama_hesaplama/widget/credie_dropdown.dart';
import 'package:dinamik_ortalama_hesaplama/widget/show_avarage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenDeger = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              Constants.headText,
              style: Constants.headStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //form widget
            Row(children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                    dersSayisi: DataHelper.allAddingLessons.length,
                    ortalama: DataHelper.calculateAverage()),
              )
            ]),

            //list
            Expanded(
              child: LessonList(
                onDismiss: (index) {
                  DataHelper.allAddingLessons.removeAt(index);
                  setState(() {});
                },
              ),
            )
          ],
        ));
  }

  _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: Constants.horizantalPadding8,
              child: _buildTextFormField(),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: Constants.horizantalPadding8,
                    child: NoteDropdownWidget(onHarfSecildi: (harf) {
                      secilenDeger = harf;
                    }),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: Constants.horizantalPadding8,
                      child: CrediDropdownWidget(
                        onKrediSecildi: (kredi) {
                          secilenKrediDegeri = kredi;
                        },
                      )),
                ),
                IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var eklenecekDers = Lesson(
                          lesson: girilenDersAdi,
                          note: secilenDeger,
                          credi: secilenKrediDegeri);

                      DataHelper.addingLesson(eklenecekDers);
                      DataHelper.calculateAverage();

                      setState(() {});
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Constants.mainColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        girilenDersAdi = deger!;
      },
      validator: (s) {
        if (s!.isEmpty) {
          return 'Boş bırakma ders adını';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: 'Matematik',
          border: OutlineInputBorder(
            borderRadius: Constants.borderRadius,
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(0.3)),
    );
  }
}
