class Book {
  Book({
    required this.id,
    required this.name,
    this.chapter_count
  });
  
  int id;
  String name;
  
  int? chapter_count;
  
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      chapter_count: json['chapter_count'],
    );
  }
}