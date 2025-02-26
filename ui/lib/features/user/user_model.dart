import 'dart:convert';

class User {
  final String id;
  final String email;
  final String? name;
  final String? avatar;
  final bool verified;
  final String status;
  final int? credits;

  User({
    required this.id,
    required this.email,
    this.name,
    this.avatar,
    required this.verified,
    required this.status,
    this.credits,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      verified: json['verified'] as bool? ?? false,
      status: json['status'] as String,
      credits: json['credits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'verified': verified,
      'status': status,
      'credits': credits,
    };
  }

  static User fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}
