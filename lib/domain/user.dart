import 'dart:io';

class User {
  String id;
  String nickname;
  String photoUrl;
  String createdAt;
  String status;
  String email;

  User(
      {this.id = "a",
      this.nickname = "Yo",
      this.photoUrl,
      this.createdAt,
      this.status = "Hello World!",
      this.email});

  User.fromJson(Map<String, dynamic> map) {
    this.fromJson(map);
  }

  void fromJson(Map<String, dynamic> map) {
    id = map['id'] ?? id;
    nickname = map['nickname'] ?? nickname;
    photoUrl = map['photoUrl'] ?? photoUrl;
    createdAt = map['createdAt'] ?? createdAt;
    status = map['status'] ?? status;
    email = map['email'] ?? email;
  }

  Map<String, String> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
      'status': status,
      'email': email,
    };
  }
}
