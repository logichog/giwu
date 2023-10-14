class BibleVersionKey {
  BibleVersionKey({
    required this.id,
    required this.table,
    required this.abbreviation,
    required this.language,
    required this.version,
    required this.infoText,
    required this.infoUrl,
    required this.publisher,
    required this.copyright,
    required this.copyrightInfo,
    this.isDefault,
  });
  
  int id;
  String table;
  String abbreviation;
  String language;
  String version;
  String infoText;
  String infoUrl;
  String publisher;
  String copyright;
  String copyrightInfo;
  bool? isDefault;

  factory BibleVersionKey.fromJson(Map<String, dynamic> json) {
    return BibleVersionKey(
      id: json['id'],
      table: json['root_table'],
      abbreviation: json['abbreviation'],
      language: json['language'],
      version: json['version'],
      infoText: json['info_text'],
      infoUrl: json['info_url'],
      publisher: json['publisher'],
      copyright: json['copyright'],
      copyrightInfo: json['copyright_info'],
      isDefault: json['is_default'] ?? false,
    );
  }
}
