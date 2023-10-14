class Verse {
  Verse({
    required this.id,
    required this.book,
    required this.chapter,
    required this.verse,
    required this.text,
  });

  int id;
  int book;
  int chapter;
  int verse;
  String text;

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      id: json['id'],
      book: json['b'],
      chapter: json['c'],
      verse: json['v'],
      text: json['t'],
    );
  }
}
