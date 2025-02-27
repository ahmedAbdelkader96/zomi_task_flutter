class UserModel {
  static DateTime fromJsonDate(String value) => DateTime.parse(value).toLocal();

  static String toJsonDate(DateTime value) => value.toUtc().toString();

  String? id;
  var createdAt;
  String name;
  String email;
  String googleId;
  String authenticationType;

  UserModel({
    this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.googleId,
    required this.authenticationType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      createdAt: UserModel.fromJsonDate(json['createdAt']),
      name: json['name'],
      email: json['email'],
      googleId: json['googleId'],
      authenticationType: json['authenticationType'],
    );
  }

  Map<String, dynamic> toJson() => {
        "createdAt": UserModel.toJsonDate(createdAt),
        "name": name,
        "email": email,
        "googleId": googleId,
        "authenticationType": authenticationType,
      };
}
