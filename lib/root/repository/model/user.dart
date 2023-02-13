import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class AleshaUser {
  String? email;
  String? uid;
  String? phone;
  String? fullname;
  String? profilepic;

  AleshaUser({
    this.email,
    this.uid,
    this.phone,
    this.fullname,
    this.profilepic,
  });

  factory AleshaUser.fromJson(Map<String, dynamic> json) =>
      _$AleshaUserFromJson(json);
  Map<String, dynamic> toJson() => _$AleshaUserToJson(this);
}