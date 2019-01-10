import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String username;
  String avatar;
  String provider;
  String accessToken;
  User (this.id, this.username,
    this.avatar, this.provider, this.accessToken);

  factory User.empty() => new User("", "", "", "", "");

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}