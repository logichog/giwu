import 'package:giwu_mobile/models/KeyEnglish.dart';

class Bible {
  Bible({
    required this.table,
    required this.abbreviation,
    required this.language,
    required this.version,
    required this.infoText,
    required this.infoUrl,
    required this.publisher,
    required this.copyright,
    required this.copyrightInfo,
  });
  
  String table;
  String abbreviation;
  String language;
  String version;
  String infoText;
  String infoUrl;
  String publisher;
  String copyright;
  String copyrightInfo;
  

  factory Bible.fromJson(Map<String, dynamic> json, List<KeyEnglish> bookList) {
    
    return Bible(
      table: json['table'],
      abbreviation: json['abbreviation'],
      language: json['language'],
      version: json['version'],
      infoText: json['infoText'],
      infoUrl: json['infoUrl'],
      publisher: json['publisher'],
      copyright: json['copyright'],
      copyrightInfo: json['copyrightInfo'],
    );
  }
}
