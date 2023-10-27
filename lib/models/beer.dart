class Beer {
  String name;
  String tagline;

  Beer({
    required this.name,
    required this.tagline,
  });

  factory Beer.fromMap(Map<String, dynamic> map) {
    return Beer(
      name: map["name"],
      tagline: map["tagline"],
    );
  }
}
