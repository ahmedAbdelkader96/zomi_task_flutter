class BlogModel {
  static DateTime fromJsonDate(String value) => DateTime.parse(value).toLocal();

  static String toJsonDate(DateTime value) => value.toUtc().toString();

  String? id;
  var createdAt;
  String title;
  String description;
  String date;
  String image;

  BlogModel({
    this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.date,
    required this.image,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['_id'],
      createdAt: BlogModel.fromJsonDate(json['createdAt']),
      title: json['title'],
      description: json['description'],
      date: json['date'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        "createdAt": BlogModel.toJsonDate(createdAt),
        "title": title,
        "description": description,
        "date": date,
        "image": image,
      };
}
