class User {
  String name;
  String email;
  String avater;

  User({required this.name, required this.email, required this.avater});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        avater = json['avater'];
}
