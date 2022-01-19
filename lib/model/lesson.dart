class Lesson {
  final String lesson;
  final double note;
  final double credi;

  Lesson({required this.lesson, required this.note, required this.credi});

  @override
  String toString() {
    return '$lesson $note $credi';
  }
}
