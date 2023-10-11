// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      phoneNumber: json['phoneNumber'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'date': instance.date,
    };
