// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AleshaUser _$AleshaUserFromJson(Map<String, dynamic> json) => AleshaUser(
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      profilepic: json['profilepic'] as String?,
    );

Map<String, dynamic> _$AleshaUserToJson(AleshaUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'profilepic': instance.profilepic,
    };
