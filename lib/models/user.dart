class User {
  int id;
  String name;
  String email;
  String phone;

  User({
    this.id = 0,
    this.name = "",
    this.email = "",
    this.phone = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
    );
  }
}
